
CREATE OR REPLACE FUNCTION mostra_usuarios() RETURNS json AS
$$
DECLARE
    resultado json;
BEGIN
    SELECT JSON_AGG(u.*) INTO resultado
    FROM usuarios u;

    RETURN resultado;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_usuario(p_id_usuario int) RETURNS json AS
$$
DECLARE
    resultado json;
BEGIN
    SELECT ROW_TO_JSON(u.*) INTO resultado
    FROM usuarios u
    WHERE u.id_usuario = p_id_usuario;

    RETURN resultado;
END;
$$
LANGUAGE plpgsql;

-- Testada
CREATE OR REPLACE FUNCTION emprestimo(p_id_usuario int, p_id_exemplar int) RETURNS void AS
$$
DECLARE
    dias_emprestimo int;
    hoje date;
BEGIN
    hoje := NOW()::date;

    SELECT c.tempo_max_emprestimos INTO dias_emprestimo
    FROM usuarios u
    JOIN categorias c
    ON u.id_usuario = p_id_usuario AND u.id_categoria = c.id_categoria;

    INSERT INTO emprestimos
    VALUES (NEXTVAL('emprestimos_seq'), hoje, 0, hoje + dias_emprestimo, p_id_usuario, p_id_exemplar);

    UPDATE exemplares
    SET disponivel = FALSE
    WHERE id_exemplar = p_id_exemplar;
END;
$$
LANGUAGE plpgsql;

-- Testada
CREATE OR REPLACE FUNCTION resolve_emprestimo(p_id_emprestimo int) RETURNS void AS
$$
BEGIN
    UPDATE emprestimos e
    SET resolvido = TRUE
    WHERE id_emprestimo = p_id_emprestimo;

    UPDATE exemplares e
    SET disponivel = TRUE
    WHERE e.id_exemplar = (SELECT e.id_exemplar FROM emprestimos e WHERE id_emprestimo = p_id_emprestimo);
END;
$$
LANGUAGE plpgsql;

-- Rever. Talvez botar um intervalo padrão de dias para reservar
CREATE OR REPLACE FUNCTION reserva(p_id_usuario int, p_id_exemplar int) RETURNS void AS
$$
BEGIN
    INSERT INTO reservas
    VALUES (NEXTVAL('reservas_seq'), NOW()::date, TRUE, p_id_usuario, p_id_exemplar);
END;
$$
LANGUAGE plpgsql;

-- Testada
CREATE OR REPLACE FUNCTION renova_emprestimo(p_id_emprestimo int) RETURNS void AS
$$
DECLARE
	dias_emprestimo int;
	hoje date;
BEGIN
	hoje := NOW()::date;

	-- Recupera o tempo máximo de empréstimo da categoria do usuário
    SELECT c.tempo_max_emprestimos INTO dias_emprestimo
    FROM emprestimos e
	JOIN usuarios u
	ON id_emprestimo = p_id_emprestimo AND e.id_usuario = u.id_usuario
	JOIN categorias c
	ON u.id_categoria = c.id_categoria;

    UPDATE emprestimos e
    SET data_emprestimo = hoje,
		data_devolucao = hoje + dias_emprestimo, num_renovacoes = num_renovacoes + 1
    WHERE e.id_emprestimo = p_id_emprestimo;
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION resolve_multa(p_id_multa int) RETURNS void AS
$$
BEGIN
    UPDATE multas
    SET pago = TRUE
    WHERE id_multa = p_id_multa;
END;
$$
LANGUAGE plpgsql;

-- Testada
CREATE OR REPLACE FUNCTION cadastra_usuario(nome varchar(256), senha varchar(256), cpf char(11), email varchar(256), endereco varchar(256), telefones char(11)[], id_categoria int) RETURNS void AS
$$
BEGIN
    INSERT INTO usuarios 
    VALUES (NEXTVAL('usuarios_seq'), nome, senha, cpf, email, endereco, telefones, id_categoria);
END;
$$
LANGUAGE plpgsql;

-- Testada
CREATE OR REPLACE FUNCTION calcula_valor_multa(p_id_multa int) RETURNS int AS
$$
DECLARE
    valor_total int;
    emissao date;
    hoje date;
BEGIN
    hoje := NOW()::date;

    SELECT data_emissao INTO emissao
    FROM multas
    WHERE id_multa = p_id_multa;
    
    valor_total := ((hoje - emissao) + 1)::int * 2;
    RETURN valor_total;
END;
$$
LANGUAGE plpgsql;

-- Testada
CREATE OR REPLACE FUNCTION mostra_multas_usuario(p_id_usuario int) RETURNS json AS
$$
DECLARE
    resultado json;
BEGIN
    -- Recupera multas do usuário
    SELECT JSON_AGG(ROW_TO_JSON(t.*)) INTO resultado
    FROM ( SELECT m.id_multa, m.data_emissao, calcula_valor_multa(m.id_multa) AS valor_multa, m.pago
           FROM usuarios u 
           JOIN emprestimos e 
           ON u.id_usuario = p_id_usuario AND u.id_usuario = e.id_usuario
           JOIN multas m
           ON m.id_emprestimo = e.id_emprestimo AND m.pago = FALSE ) t;

    RETURN resultado;
END;
$$
LANGUAGE plpgsql;

-- Testada
CREATE OR REPLACE FUNCTION gera_multas() RETURNS void AS
$$
DECLARE
    reg record;
    hoje date;
    categoria int;
BEGIN
    hoje := NOW()::date;

    -- Recupera todos os emprestimos não resolvidos
    FOR reg IN (SELECT * FROM emprestimos WHERE resolvido = FALSE) LOOP
        categoria := (SELECT id_categoria FROM usuarios u WHERE reg.id_usuario = u.id_usuario);
                      
        -- Cria uma multa se ela não foi criada ainda
        IF hoje > reg.data_devolucao AND NOT EXISTS (SELECT * FROM multas m WHERE reg.id_emprestimo = m.id_emprestimo) AND categoria <> 3 AND categoria <> 4 THEN
            INSERT INTO multas VALUES (NEXTVAL('multas_seq'), hoje, FALSE, reg.id_emprestimo);
        END IF;
    END LOOP;
END;
$$
LANGUAGE plpgsql;

-- Testada
CREATE OR REPLACE FUNCTION mostra_emprestimos_usuario(p_id_usuario int) RETURNS json AS
$$
DECLARE
    resultado json;
BEGIN
    SELECT JSON_AGG(e.*) INTO resultado
    FROM emprestimos e
    WHERE id_usuario = p_id_usuario;

    RETURN resultado;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION reserva_exemplar(p_id_usuario int, p_id_exemplar int) RETURNS void AS
$$
DECLARE
    hoje date;
    data_reserva date;
BEGIN
    hoje := NOW()::date;

    IF (SELECT disponivel FROM exemplares WHERE id_exemplar = p_id_exemplar) THEN
        INSERT INTO reserva VALUES (NEXTVAL('reserva_seq'), hoje, TRUE, p_id_usuario, p_id_exemplar);

    ELSIF EXISTS (SELECT data_devolucao INTO data_reserva 
                  FROM emprestimos e
                  WHERE hoje < data_devolucao AND id_exemplar = p_id_exemplar)
    THEN
        INSERT INTO reserva VALUES (NEXTVAL('reserva_seq'), data_reserva, TRUE, p_id_usuario, p_id_exemplar);

    ELSE
        RAISE EXCEPTION 'O exemplar não está disponível.';

    END IF;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_reservas_usuario(p_id_usuario int) RETURNS json AS
$$
DECLARE
    resultado json;
BEGIN
    SELECT JSON_AGG(r.*) INTO resultado
    FROM reservas r
    WHERE id_usuario = p_id_usuario;

    RETURN resultado;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cancela_reserva(p_id_reserva int) RETURNS void AS
$$
BEGIN
    UPDATE reservas
    SET ativa = FALSE
    WHERE id_reserva = p_id_reserva;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION timeout_reservas() RETURNS void as
$$
DECLARE
    hoje date;
BEGIN
    hoje := NOW()::date;
    UPDATE reservas
    SET ativa = FALSE
    WHERE data_reserva = hoje - 1;
END;
$$
LANGUAGE plpgsql;