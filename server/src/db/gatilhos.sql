
-- Gatilho que impede o empréstimo de um usuário que atingiu seu limite
CREATE OR REPLACE FUNCTION verifica_limite() RETURNS trigger AS
$$
DECLARE
    cont_livros int;
    limite int;
BEGIN
    -- Recupera limite de livros pela categoria
    SELECT num_livros_emprestado INTO limite
    FROM usuarios u
    JOIN categorias c
    ON u.id_usuario = NEW.id_usuario AND u.id_categoria = c.id_categoria;

    -- Recupera a contagem de livros
    SELECT COUNT(*) INTO cont_livros
    FROM emprestimos e
    WHERE e.id_usuario = NEW.id_usuario;

    IF cont_livros = limite THEN
        RAISE EXCEPTION 'O usuário atingiu seu limite de empréstimos';
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE trigger verifica_limite_g
BEFORE INSERT OR UPDATE ON emprestimos
FOR EACH ROW
EXECUTE PROCEDURE verifica_limite();


-- Gatilho que impede o empréstimo para um usuário que tem livros atrasados
-- Testado
CREATE OR REPLACE FUNCTION verifica_livros_atrasados() RETURNS trigger AS
$$
DECLARE
    num_livros_atrasados int;
    hoje date;
BEGIN
    -- Caso especial: Se a operação for de update e o sistema estiver tentando resolver o empréstimo
    IF TG_OP = 'UPDATE' AND OLD.resolvido = FALSE AND NEW.resolvido = TRUE THEN
        RETURN NEW;
    END IF;
    
    -- Conta a quantidade de livros atrasados
    hoje := NOW()::date;
    SELECT COUNT(*) INTO num_livros_atrasados
    FROM emprestimos
    WHERE id_usuario = NEW.id_usuario AND hoje > data_devolucao AND resolvido = FALSE;
    
    IF num_livros_atrasados > 0 THEN
        RAISE EXCEPTION 'O usuário possui livros em atraso';
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE trigger verifica_livros_atrasados_g
BEFORE INSERT OR UPDATE ON emprestimos
FOR EACH ROW
EXECUTE PROCEDURE verifica_livros_atrasados();

--Gatilho que impede o empréstimo para um usuário que tem multas em aberto
-- Testado
CREATE OR REPLACE FUNCTION verifica_multas_abertas() RETURNS trigger AS
$$
DECLARE
    num_multas_abertas int;
BEGIN
     -- Caso especial: Se a operação for de update e o sistema estiver tentando resolver o empréstimo
    IF TG_OP = 'UPDATE' AND OLD.resolvido = FALSE AND NEW.resolvido = TRUE THEN
        RETURN NEW;
    END IF;

    -- Conta a quantidade de multas não pagas
    SELECT COUNT(*) INTO num_multas_abertas
    FROM usuarios u 
    JOIN emprestimos e
    ON u.id_usuario = e.id_usuario AND u.id_usuario = NEW.id_usuario
    JOIN multas m
    ON m.id_emprestimo = e.id_emprestimo
    WHERE m.pago = FALSE;

    IF num_multas_abertas > 0 THEN
        RAISE EXCEPTION 'O usuário tem multas em aberto';
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE trigger verifica_multas_abertas_g
BEFORE INSERT OR UPDATE ON emprestimos
FOR EACH ROW
EXECUTE PROCEDURE verifica_multas_abertas();

-- Gatilho que verifica se um livro está disponível
-- Testado
CREATE OR REPLACE FUNCTION verifica_emprestimo_data() RETURNS trigger AS
$$
DECLARE
    p_disponivel bool;
BEGIN
    p_disponivel := (SELECT disponivel 
                     FROM exemplares e 
                     WHERE e.id_exemplar = NEW.id_exemplar);
    
    IF NOT p_disponivel THEN
        RAISE EXCEPTION 'O livro não está disponível';
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE trigger verifica_emprestimo_data_g
BEFORE INSERT ON emprestimos
FOR EACH ROW
EXECUTE PROCEDURE verifica_emprestimo_data();

-- Gatilho que verifica se o livro sendo emprestado é da coleção de reserva
-- Testado
CREATE OR REPLACE FUNCTION verifica_emprestimo_colecao_reserva() RETURNS trigger AS
$$
DECLARE
    colecao varchar(256);
BEGIN
    SELECT e.colecao INTO colecao
    FROM exemplares e
    WHERE NEW.id_exemplar = e.id_exemplar;

    IF colecao = 'RESERVA' THEN
        RAISE EXCEPTION 'Livros da coleção de reserva não podem ser emprestados';
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE trigger verifica_emprestimo_colecao_reserva_g
BEFORE INSERT ON emprestimos
FOR EACH ROW
EXECUTE PROCEDURE verifica_emprestimo_colecao_reserva();

-- Gatilho que verifica a possibilidade de reserva em determinada data
CREATE OR REPLACE FUNCTION verifica_reserva_data() RETURNS trigger AS
$$
DECLARE
    reg record;
BEGIN
    -- Recupera todos os emprestimos com esse exemplar
    FOR reg IN (SELECT data_emprestimo, data_devolucao FROM emprestimos e WHERE e.id_exemplar = NEW.id_exemplar) LOOP
        IF NEW.data_emprestimo BETWEEN reg.data_emprestimo AND reg.data_devolucao THEN
            RAISE EXCEPTION 'O livro não está disponível';
        END IF;
    END LOOP;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE trigger verifica_reserva_data_g
BEFORE INSERT OR UPDATE ON reservas
FOR EACH ROW
EXECUTE PROCEDURE verifica_reserva_data();

-- Gatilho que impede mais renovações do que o permitido
-- Testado
CREATE OR REPLACE FUNCTION verifica_renovacoes() RETURNS trigger AS
$$
BEGIN
    IF NEW.num_renovacoes > (SELECT max_renovacoes FROM constantes) THEN
        RAISE EXCEPTION 'O usuário já atingiu o número máximo de renovações.';
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE trigger verifica_renovacoes_g
BEFORE UPDATE ON emprestimos
FOR EACH ROW
EXECUTE PROCEDURE verifica_renovacoes();

-- Impede auto-supervisão
-- Testado
CREATE OR REPLACE FUNCTION verifica_auto_supervisao() RETURNS trigger AS
$$
BEGIN
    IF NEW.id_bibliotecario = NEW.id_assistente THEN
        RAISE EXCEPTION 'Um funcionário não pode supervisionar ele mesmo.';
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE trigger verifica_auto_supervisao_g
BEFORE INSERT OR UPDATE ON supervisao
FOR EACH ROW
EXECUTE PROCEDURE verifica_auto_supervisao();

CREATE OR REPLACE FUNCTION impede_emprestimo_quando_reservado() RETURNS trigger AS
$$
DECLARE
    hoje date;
BEGIN
    hoje := NOW()::date;

    IF EXISTS (SELECT * 
               FROM reservas r
               WHERE NEW.id_exemplar = r.id_exemplar AND hoje = r.data_reserva AND r.ativa = TRUE)
    THEN
        RAISE EXCEPTION 'O exemplar foi reservado até o fim do dia.';
    END IF;

RETURN NEW;

END;
$$
LANGUAGE plpgsql;