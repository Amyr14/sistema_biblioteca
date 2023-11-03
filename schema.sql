CREATE DATABASE sistema_blibioteca;

CREATE ROLE usuario_biblioteca;
ALTER DATABASE sistema_blibioteca OWNER TO usuario_biblioteca;

\connect sistema_blibioteca;

-- DROP SCHEMA public;

COMMENT ON SCHEMA public IS 'Esquema de dados do sistema da biblioteca';

-- DROP SEQUENCE public.autores_id_autor_seq;

CREATE SEQUENCE public.autores_id_autor_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.autores_id_autor_seq OWNER TO usuario_biblioteca;
GRANT ALL ON SEQUENCE public.autores_id_autor_seq TO usuario_biblioteca;

-- DROP SEQUENCE public.categorias_id_categoria_seq;

CREATE SEQUENCE public.categorias_id_categoria_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.categorias_id_categoria_seq OWNER TO usuario_biblioteca;
GRANT ALL ON SEQUENCE public.categorias_id_categoria_seq TO usuario_biblioteca;

-- DROP SEQUENCE public.emprestimos_id_emprestimo_seq;

CREATE SEQUENCE public.emprestimos_id_emprestimo_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.emprestimos_id_emprestimo_seq OWNER TO usuario_biblioteca;
GRANT ALL ON SEQUENCE public.emprestimos_id_emprestimo_seq TO usuario_biblioteca;

-- DROP SEQUENCE public.emprestimos_tem_exemplares_id_seq;

CREATE SEQUENCE public.emprestimos_tem_exemplares_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.emprestimos_tem_exemplares_id_seq OWNER TO usuario_biblioteca;
GRANT ALL ON SEQUENCE public.emprestimos_tem_exemplares_id_seq TO usuario_biblioteca;

-- DROP SEQUENCE public.exemplares_id_exemplar_seq;

CREATE SEQUENCE public.exemplares_id_exemplar_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.exemplares_id_exemplar_seq OWNER TO usuario_biblioteca;
GRANT ALL ON SEQUENCE public.exemplares_id_exemplar_seq TO usuario_biblioteca;

-- DROP SEQUENCE public.funcionarios_id_funcionarios_seq;

CREATE SEQUENCE public.funcionarios_id_funcionarios_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.funcionarios_id_funcionarios_seq OWNER TO usuario_biblioteca;
GRANT ALL ON SEQUENCE public.funcionarios_id_funcionarios_seq TO usuario_biblioteca;

-- DROP SEQUENCE public.funcionarios_tem_telefones_id_seq;

-- CREATE SEQUENCE public.funcionarios_tem_telefones_id_seq
--	INCREMENT BY 1
--	MINVALUE 1
--	MAXVALUE 2147483647
--	START 1
--	CACHE 1
--	NO CYCLE;

-- Permissions

-- ALTER SEQUENCE public.funcionarios_tem_telefones_id_seq OWNER TO usuario_biblioteca;
-- GRANT ALL ON SEQUENCE public.funcionarios_tem_telefones_id_seq TO usuario_biblioteca;

-- DROP SEQUENCE public.livros_id_livro_seq;

CREATE SEQUENCE public.livros_id_livro_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.livros_id_livro_seq OWNER TO usuario_biblioteca;
GRANT ALL ON SEQUENCE public.livros_id_livro_seq TO usuario_biblioteca;

-- DROP SEQUENCE public.livros_tem_autores_id_seq;

-- CREATE SEQUENCE public.livros_tem_autores_id_seq
--	INCREMENT BY 1
--	MINVALUE 1
--	MAXVALUE 2147483647
--	START 1
--	CACHE 1
--	NO CYCLE;

-- Permissions

-- ALTER SEQUENCE public.livros_tem_autores_id_seq OWNER TO usuario_biblioteca;
-- GRANT ALL ON SEQUENCE public.livros_tem_autores_id_seq TO usuario_biblioteca;

-- DROP SEQUENCE public.multas_id_multa_seq;

CREATE SEQUENCE public.multas_id_multa_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.multas_id_multa_seq OWNER TO usuario_biblioteca;
GRANT ALL ON SEQUENCE public.multas_id_multa_seq TO usuario_biblioteca;

-- DROP SEQUENCE public.reservas_id_exemplar_seq;

CREATE SEQUENCE public.reservas_id_exemplar_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.reservas_id_exemplar_seq OWNER TO usuario_biblioteca;
GRANT ALL ON SEQUENCE public.reservas_id_exemplar_seq TO usuario_biblioteca;

-- DROP SEQUENCE public.reservas_id_reserva_seq;

CREATE SEQUENCE public.reservas_id_reserva_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.reservas_id_reserva_seq OWNER TO usuario_biblioteca;
GRANT ALL ON SEQUENCE public.reservas_id_reserva_seq TO usuario_biblioteca;

-- DROP SEQUENCE public.supervisao_id_supervisao_seq;

CREATE SEQUENCE public.supervisao_id_supervisao_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.supervisao_id_supervisao_seq OWNER TO usuario_biblioteca;
GRANT ALL ON SEQUENCE public.supervisao_id_supervisao_seq TO usuario_biblioteca;

-- DROP SEQUENCE public.telefones_id_telefone_seq;

-- CREATE SEQUENCE public.telefones_id_telefone_seq
--	INCREMENT BY 1
--	MINVALUE 1
--	MAXVALUE 2147483647
--	START 1
--	CACHE 1
--	NO CYCLE;

-- Permissions

--ALTER SEQUENCE public.telefones_id_telefone_seq OWNER TO usuario_biblioteca;
-- GRANT ALL ON SEQUENCE public.telefones_id_telefone_seq TO usuario_biblioteca;

-- DROP SEQUENCE public.usuarios_id_usuario_seq;

CREATE SEQUENCE public.usuarios_id_usuario_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNER TO usuario_biblioteca;
GRANT ALL ON SEQUENCE public.usuarios_id_usuario_seq TO usuario_biblioteca;

-- DROP SEQUENCE public.usuarios_tem_telefone_id_seq;

-- CREATE SEQUENCE public.usuarios_tem_telefone_id_seq
--	INCREMENT BY 1
--	MINVALUE 1
--	MAXVALUE 2147483647
--	START 1
--	CACHE 1
--	NO CYCLE;

-- Permissions

-- ALTER SEQUENCE public.usuarios_tem_telefone_id_seq OWNER TO usuario_biblioteca;
-- GRANT ALL ON SEQUENCE public.usuarios_tem_telefone_id_seq TO usuario_biblioteca;
-- public.autores definition

-- Drop table

-- DROP TABLE public.autores;

-- CREATE TABLE public.autores (
--	id_autor serial4 NOT NULL,
--	nome varchar(256) NULL,
--	CONSTRAINT autores_pk PRIMARY KEY (id_autor)
--);

-- Permissions

-- ALTER TABLE public.autores OWNER TO usuario_biblioteca;
-- GRANT ALL ON TABLE public.autores TO usuario_biblioteca;


-- public.categorias definition

-- Drop table

-- DROP TABLE public.categorias;

CREATE TABLE public.categorias (
	id_categoria serial4 NOT NULL,
	nome_categoria varchar(256) NOT NULL,
	tempo_max_emprestimos int4 NOT NULL,
	num_livros_emprestado int4 NOT NULL,
	CONSTRAINT categorias_pk PRIMARY KEY (id_categoria)
);

-- Permissions

ALTER TABLE public.categorias OWNER TO usuario_biblioteca;
GRANT ALL ON TABLE public.categorias TO usuario_biblioteca;


-- public.funcionarios definition

-- Drop table

-- DROP TABLE public.funcionarios;

CREATE TABLE public.funcionarios (
	id_funcionario int4 NOT NULL DEFAULT nextval('funcionarios_id_funcionarios_seq'::regclass),
	nome varchar(256) NOT NULL,
	cpf bpchar(11) NOT NULL,
	email varchar(256) NOT NULL,
	telefones char(11)[] NOT NULL,
	tipo_funcionario varchar(256) NOT NULL,
	CONSTRAINT funcionarios_pk PRIMARY KEY (id_funcionario)
);

-- Permissions

ALTER TABLE public.funcionarios OWNER TO usuario_biblioteca;
GRANT ALL ON TABLE public.funcionarios TO usuario_biblioteca;


-- public.telefones definition

-- Drop table

-- DROP TABLE public.telefones;

-- CREATE TABLE public.telefones (
--	id_telefone serial4 NOT NULL,
--	telefone bpchar(11) NULL,
--	CONSTRAINT telefones_pk PRIMARY KEY (id_telefone)
--);

-- Permissions

-- ALTER TABLE public.telefones OWNER TO usuario_biblioteca;
-- GRANT ALL ON TABLE public.telefones TO usuario_biblioteca;


-- public.funcionarios_tem_telefones definition

-- Drop table

-- DROP TABLE public.funcionarios_tem_telefones;

-- CREATE TABLE public.funcionarios_tem_telefones (
--	id serial4 NOT NULL,
--	id_telefone int4 NOT NULL,
--	id_funcionario int4 NOT NULL,
--	CONSTRAINT funcionarios_tem_telefones_pk PRIMARY KEY (id),
--	CONSTRAINT funcionarios_tem_telefones_fk FOREIGN KEY (id_funcionario) REFERENCES public.funcionarios(id_funcionario) ON DELETE CASCADE ON UPDATE CASCADE,
--	CONSTRAINT funcionarios_tem_telefones_fk_1 FOREIGN KEY (id_telefone) REFERENCES public.telefones(id_telefone) ON DELETE CASCADE ON UPDATE CASCADE
--);

-- Permissions

-- ALTER TABLE public.funcionarios_tem_telefones OWNER TO usuario_biblioteca;
-- GRANT ALL ON TABLE public.funcionarios_tem_telefones TO usuario_biblioteca;


-- public.livros definition

-- Drop table

-- DROP TABLE public.livros;

CREATE TABLE public.livros (
	id_livro serial4 NOT NULL,
	titulo varchar(256) NOT NULL,
	editora varchar(256) NOT NULL,
	isbn bpchar(13) NOT NULL,
	autores varchar(256)[] NOT NULL,
	id_funcionario int4 NOT NULL,
	CONSTRAINT livros_pk PRIMARY KEY (id_livro),
	CONSTRAINT livros_fk FOREIGN KEY (id_funcionario) REFERENCES public.funcionarios(id_funcionario) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE public.livros OWNER TO usuario_biblioteca;
GRANT ALL ON TABLE public.livros TO usuario_biblioteca;


-- public.livros_tem_autores definition

-- Drop table

-- DROP TABLE public.livros_tem_autores;

-- CREATE TABLE public.livros_tem_autores (
--	id serial4 NOT NULL,
--	id_livro int4 NOT NULL,
--	id_autor int4 NOT NULL,
--	CONSTRAINT livros_tem_autores_pk PRIMARY KEY (id),
--	CONSTRAINT livros_tem_autores_fk FOREIGN KEY (id_livro) REFERENCES public.livros(id_livro) ON DELETE CASCADE ON UPDATE CASCADE,
--	CONSTRAINT livros_tem_autores_fk_1 FOREIGN KEY (id_autor) REFERENCES public.autores(id_autor) ON DELETE RESTRICT ON UPDATE CASCADE
--);

-- Permissions

-- ALTER TABLE public.livros_tem_autores OWNER TO usuario_biblioteca;
-- GRANT ALL ON TABLE public.livros_tem_autores TO usuario_biblioteca;


-- public.supervisao definition

-- Drop table

-- DROP TABLE public.supervisao;

CREATE TABLE public.supervisao (
	id_supervisao serial4 NOT NULL,
	id_bibliotecario int4 NOT NULL,
	id_assistente int4 NOT NULL,
	CONSTRAINT supervisao_pk PRIMARY KEY (id_supervisao),
	CONSTRAINT supervisao_fk FOREIGN KEY (id_bibliotecario) REFERENCES public.funcionarios(id_funcionario),
	CONSTRAINT supervisao_fk_1 FOREIGN KEY (id_assistente) REFERENCES public.funcionarios(id_funcionario)
);

-- Permissions

ALTER TABLE public.supervisao OWNER TO usuario_biblioteca;
GRANT ALL ON TABLE public.supervisao TO usuario_biblioteca;


-- public.usuarios definition

-- Drop table

-- DROP TABLE public.usuarios;

CREATE TABLE public.usuarios (
	id_usuario serial4 NOT NULL,
	nome varchar(256) NOT NULL,
	cpf bpchar(11) NOT NULL,
	email varchar(256) NOT NULL,
	endereco varchar(256) NOT NULL,
	telefones bpchar(11)[] NOT NULL,
	id_categoria int4 NOT NULL,
	CONSTRAINT usuarios_pk PRIMARY KEY (id_usuario),
	CONSTRAINT usuarios_fk FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE public.usuarios OWNER TO usuario_biblioteca;
GRANT ALL ON TABLE public.usuarios TO usuario_biblioteca;


-- public.usuarios_tem_telefone definition

-- Drop table

-- DROP TABLE public.usuarios_tem_telefone;

-- CREATE TABLE public.usuarios_tem_telefone (
--	id serial4 NOT NULL,
--	id_usuario int4 NOT NULL,
--	id_telefone int4 NOT NULL,
--	CONSTRAINT usuarios_tem_telefone_pk PRIMARY KEY (id),
--	CONSTRAINT usuarios_tem_telefone_fk FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
--	CONSTRAINT usuarios_tem_telefone_fk_1 FOREIGN KEY (id_telefone) REFERENCES public.telefones(id_telefone) ON DELETE CASCADE ON UPDATE CASCADE
--);

-- Permissions

-- ALTER TABLE public.usuarios_tem_telefone OWNER TO usuario_biblioteca;
-- GRANT ALL ON TABLE public.usuarios_tem_telefone TO usuario_biblioteca;

-- public.exemplares definition

-- Drop table

-- DROP TABLE public.exemplares;

CREATE TABLE public.exemplares (
	id_exemplar serial4 NOT NULL,
	-- num_exemplar int4 NOT NULL,
	colecao varchar(256) NOT NULL,
	disponivel bool NOT NULL,
	id_livro int4 NOT NULL,
	id_funcionario int4 NOT NULL,
	CONSTRAINT exemplares_pk PRIMARY KEY (id_exemplar),
	CONSTRAINT exemplares_fk FOREIGN KEY (id_livro) REFERENCES public.livros(id_livro) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT exemplares_fk_1 FOREIGN KEY (id_funcionario) REFERENCES public.funcionarios(id_funcionario) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE public.exemplares OWNER TO usuario_biblioteca;
GRANT ALL ON TABLE public.exemplares TO usuario_biblioteca;


-- public.emprestimos definition

-- Drop table

-- DROP TABLE public.emprestimos;

CREATE TABLE public.emprestimos (
	id_emprestimo serial4 NOT NULL,
	data_emprestimo date NOT NULL,
	num_renovacoes int4 NOT NULL,
	data_devolucao date NOT NULL,
	id_usuario int4 NOT NULL,
	id_exemplar int4 NOT NULL,
	resolvido bool NOT NULL DEFAULT FALSE,
	CONSTRAINT emprestimos_pk PRIMARY KEY (id_emprestimo),
	CONSTRAINT emprestimos_fk FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE SET NULL ON UPDATE SET NULL,
	CONSTRAINT emprestimos_fK2 FOREIGN KEY (id_exemplar) REFERENCES public.exemplares(id_exemplar) ON DELETE SET NULL ON UPDATE SET NULL
);

-- Permissions

ALTER TABLE public.emprestimos OWNER TO usuario_biblioteca;
GRANT ALL ON TABLE public.emprestimos TO usuario_biblioteca;


-- public.multas definition

-- Drop table

-- DROP TABLE public.multas;

CREATE TABLE public.multas (
	id_multa serial4 NOT NULL,
	data_emissao date NOT NULL,
	pago bool NOT NULL,
	id_emprestimo int4 NOT NULL,
	CONSTRAINT multas_pk PRIMARY KEY (id_multa),
	CONSTRAINT multas_fk FOREIGN KEY (id_emprestimo) REFERENCES public.emprestimos(id_emprestimo) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE public.multas OWNER TO usuario_biblioteca;
GRANT ALL ON TABLE public.multas TO usuario_biblioteca;


-- public.reservas definition

-- Drop table

-- DROP TABLE public.reservas;

CREATE TABLE public.reservas (
	id_reserva serial4 NOT NULL,
	data_reserva date NOT NULL,
	ativa bool NOT NULL,
	id_usuario int4 NOT NULL,
	id_exemplar serial4 NOT NULL,
	CONSTRAINT reservas_pk PRIMARY KEY (id_reserva),
	CONSTRAINT reservas_fk FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT reservas_fk_1 FOREIGN KEY (id_exemplar) REFERENCES public.exemplares(id_exemplar) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE public.reservas OWNER TO usuario_biblioteca;
GRANT ALL ON TABLE public.reservas TO usuario_biblioteca;


-- public.emprestimos_tem_exemplares definition

-- Drop table

-- DROP TABLE public.emprestimos_tem_exemplares;

-- CREATE TABLE public.emprestimos_tem_exemplares (
--	id serial4 NOT NULL,
--	id_emprestimo int4 NOT NULL,
--	id_exemplar int4 NOT NULL,
--	devolvido bool,
--	CONSTRAINT emprestimos_tem_exemplares_pk PRIMARY KEY (id),
--	CONSTRAINT emprestimos_tem_exemplares_fk FOREIGN KEY (id_emprestimo) REFERENCES public.emprestimos(id_emprestimo) ON DELETE CASCADE ON UPDATE CASCADE,
--	CONSTRAINT emprestimos_tem_exemplares_fk_1 FOREIGN KEY (id_exemplar) REFERENCES public.exemplares(id_exemplar) ON DELETE CASCADE ON UPDATE CASCADE
--);

-- Permissions

-- ALTER TABLE public.emprestimos_tem_exemplares OWNER TO usuario_biblioteca;
-- GRANT ALL ON TABLE public.emprestimos_tem_exemplares TO usuario_biblioteca;

CREATE TABLE constantes (
	max_renovacoes int
);

INSERT INTO constantes VALUES (3);

ALTER TABLE public.reservas OWNER TO usuario_biblioteca;
GRANT ALL ON TABLE public.reservas TO usuario_biblioteca;

-- Permissions

GRANT ALL ON SCHEMA public TO usuario_biblioteca;
GRANT USAGE ON SCHEMA public TO public;

-- Gatilho que impede o empréstimo de um usuário que atingiu seu limite
CREATE OR REPLACE FUNCTION verifica_limite() RETURNS TRIGGER AS
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

CREATE OR REPLACE TRIGGER verifica_limite_g
BEFORE INSERT OR UPDATE ON emprestimos
FOR EACH ROW
EXECUTE PROCEDURE verifica_limite();


-- Gatilho que impede o empréstimo para um usuário que tem livros atrasados
CREATE OR REPLACE FUNCTION verifica_livros_atrasados() RETURNS TRIGGER AS
$$
DECLARE
    num_livros_atrasados int;
BEGIN
    -- Conta a quantidade de livros atrasados
    SELECT COUNT(*) INTO num_livros_atrasados
    FROM usuarios u 
    JOIN emprestimos e
    ON u.id_usuario = e.id_usuario AND u.id_usuario = NEW.id_usuario AND NOW()::DATE > data_devolucao AND resolvido = FALSE;
    
    IF num_livros_atrasados > 0 THEN
        RAISE EXCEPTION 'O usuário possui livros em atraso';
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER verifica_livros_atrasados_g
BEFORE INSERT OR UPDATE ON emprestimos
FOR EACH ROW
EXECUTE PROCEDURE verifica_livros_atrasados();

--Gatilho que impede o empréstimo para um usuário que tem multas em aberto
CREATE OR REPLACE FUNCTION verifica_multas_abertas() RETURNS TRIGGER AS
$$
DECLARE
    num_multas_abertas int;
BEGIN
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
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER verifica_multas_abertas_g
BEFORE INSERT OR UPDATE ON emprestimos
FOR EACH ROW
EXECUTE PROCEDURE verifica_multas_abertas();

-- Gatilho que verifica se um livro está disponível
CREATE OR REPLACE FUNCTION verifica_emprestimo_data() RETURNS TRIGGER AS
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


CREATE OR REPLACE TRIGGER verifica_emprestimo_data_g
BEFORE INSERT ON emprestimos
FOR EACH ROW
EXECUTE PROCEDURE verifica_emprestimo_data();

-- Gatilho que verifica se o livro sendo emprestado é da coleção de reserva
CREATE OR REPLACE FUNCTION verifica_emprestimo_colecao_reserva() RETURNS TRIGGER AS
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

CREATE OR REPLACE TRIGGER verifica_emprestimo_colecao_reserva_g
BEFORE INSERT ON emprestimos
FOR EACH ROW
EXECUTE PROCEDURE verifica_emprestimo_colecao_reserva();

-- Gatilho que verifica a possibilidade de reserva em determinada data
CREATE OR REPLACE FUNCTION verifica_reserva_data() RETURNS TRIGGER AS
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

CREATE OR REPLACE TRIGGER verifica_reserva_data_g
BEFORE INSERT OR UPDATE ON reserva
FOR EACH ROW
EXECUTE PROCEDURE verifica_reserva_data();

-- Gatilho que impede mais renovações do que o permitido
CREATE OR REPLACE FUNCTION verifica_renovacoes() RETURNS TRIGGER AS
$$
BEGIN
    
    IF NEW.num_renovacoes > (SELECT max_renovacoes FROM constantes) THEN
        RAISE EXCEPTION 'O usuário já atingiu o número máximo de renovações.';
    END IF;

    RETURN OLD;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER verifica_renovacoes_g
BEFORE UPDATE ON emprestimos
FOR EACH ROW
EXECUTE PROCEDURE verifica_renovacoes();

CREATE OR REPLACE FUNCTION mostra_usuarios() RETURNS TABLE(id_usuario int, nome varchar(256), cpf bpchar(11), email varchar(256), endereco varchar(256), telefones bpchar(11)[], id_categoria int) AS
$$
BEGIN
    RETURN QUERY SELECT * FROM usuarios
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_usuario(p_id_usuario int) RETURNS TABLE(id_usuario int, nome varchar(256), cpf bpchar(11), email varchar(256), endereco varchar(256), telefones bpchar(11)[], id_categoria int) AS
$$
BEGIN
    RETURN QUERY
    SELECT *
    FROM usuarios u
    WHERE u.id_usuario = p_id_usuario;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION emprestimo(p_id_usuario int, p_id_exemplar int) RETURNS void AS
$$
DECLARE
    dias_emprestimo int;
BEGIN
    SELECT c.tempo_max_emprestimos INTO dias_emprestimo
    FROM usuarios u
    JOIN categorias c
    ON u.id_usuario = p_id_usuario AND u.id_categoria = c.id_categoria;

    INSERT INTO emprestimos
    VALUES (NEXTVAL('emprestimos_id_emprestimos_seq'), NOW()::date, 0, NOW::DATE + dias_emprestimo, p_id_usuario, p_id_exemplar);

    UPDATE exemplares
    SET disponivel = FALSE
    WHERE id_exemplar = p_id_exemplar;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION resolve_emprestimo(p_id_emprestimo int) RETURNS void AS
$$
BEGIN
    UPDATE emprestimos e
    SET resolvido = TRUE
    WHERE e.id_emprestimo = p_id_emprestimo;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION reserva(p_id_usuario int, p_id_exemplar int) RETURNS void AS
$$
BEGIN
    INSERT INTO reservas
    VALUES (NEXTVAL('reservas_id_reserva_seq'), NOW()::date, TRUE, p_id_usuario, id_exemplar);
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION renova_emprestimo(p_id_emprestimo int) RETURNS void AS
$$
DECLARE dias_emprestimo int;
BEGIN
    SELECT c.tempo_max_emprestimos INTO dias_emprestimo
    FROM usuarios u
    JOIN categorias c
    ON u.id_usuario = p_id_usuario AND u.id_categoria = c.id_categoria;

    UPDATE emprestimos e
    SET data_emprestimo = data_emprestimo + dias_emprestimo, num_renovacoes = num_renovacoes + 1
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

CREATE OR REPLACE FUNCTION cadastra_usuario(nome varchar(256), cpf bpchar(11), email varchar(256), endereco varchar(256), telefones bpchar(11)[], id_categoria int) RETURNS void AS
$$
BEGIN
    INSERT INTO usuarios VALUES (NEXTVAL('usuarios_id_usuarios_seq'), nome, cpf, email, endereco, telefones, id_categoria);
END;
$$
LANGUAGE plpgsql;

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
    
    valor_total := (hoje - emissao)::int * 2;
    RETURN valor_total;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_multas_usuario(p_id_usuario int) RETURNS TABLE(id_multa int, data_emissao date, valor int, pago bool) AS
$$
DECLARE
    valor_multa int;
    reg record;
BEGIN
    FOR reg IN (SELECT m.id_multa, m.data_emissao, m.pago
                FROM usuario u 
                JOIN emprestimos e 
                ON u.id_usuario = p_id_usuario AND u.id_usuario = e.id_usuario
                JOIN multas m
                ON m.id_emprestimo = e.id_emprestimo AND m.pago = FALSE)
    LOOP
        valor_multa := calcula_valor_multa(reg.id_multa);
        RETURN NEXT reg.id_multa, reg.data_emissao, valor_multa, reg.pago;
    END LOOP;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gera_multas() RETURNS void AS
$$
DECLARE
    reg record;
    hoje date;
    categoria varchar(256);
BEGIN
    hoje := NOW()::date;
    FOR reg IN (SELECT * FROM emprestimos WHERE resolvido = FALSE) LOOP
        categoria := (SELECT c.categoria
                      FROM categoria c
                      JOIN usuarios u
                      ON reg.id_usuario = u.id_usuario AND u.id_categoria = c.id_categoria)
        
        IF hoje > data_devolucao AND NOT EXISTS (SELECT * FROM multas m WHERE reg.id_emprestimo = m.id_emprestimo) AND categoria <> 3 AND categoria <> 4 THEN
            INSERT INTO multas VALUES (NEXTVAL('multas_id_multa_seq'), hoje, FALSE, reg.id_emprestimo);
        END IF;
    END LOOP;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_emprestimos_usuario(p_id_usuario int) RETURNS TABLE(id_emprestimo int, data_emprestimo date, data_devolucao date, num_renovacoes int, id_exemplar int) AS
$$
BEGIN
    RETURN QUERY
    SELECT e.id_emprestimo, e.data_emprestimo, e.data_devolucao, e.num_renovacoes, e.id_exemplar
    FROM emprestimo e
    WHERE e.id_usuario = p_id_usuario;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION identifica_usuario_com_exemplar(p_id_exemplar int) RETURNS TABLE(id_usuario, nome) AS
$$
DECLARE
    hoje date;
BEGIN
    hoje := NOW()::date;
    RETURN QUERY
    SELECT e.id_usuario, e.nome
    FROM emprestimos e
    JOIN exemplares ex
    ON (hoje BETWEEN e.data_emprestimo AND e.data_devolucao) AND ex.id_exemplar = p_id_exemplar AND e.id_exemplar = ex.id_exemplar;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cadastra_livro(titulo varchar(256), editora varchar(256), isbn bpchar(13), autores varchar(256)[], id_funcionario int) RETURNS void AS
$$
BEGIN
    INSERT INTO livros
    VALUES (NEXTVAL('livros_id_livro_seq'), titulo, editora, isbn, autores, id_funcionario);
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cadastra_exemplar(colecao varchar(256), id_livro int, id_funcionario int) RETURNS void AS
$$
BEGIN
    INSERT INTO exemplares
    VALUES (NEXTVAL('exemplares_id_exemplar_seq'), colecao, TRUE, id_livro, id_funcionario);
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_livros() RETURNS TABLE (id_livro int, titulo varchar(256), isbn bpchar(13), autores varchar(256)[], id_funcionario int) AS
$$
BEGIN
    RETURN QUERY SELECT * FROM livros;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_livro(p_id_livro int) RETURNS TABLE (id_livro int, titulo varchar(256), isbn bpchar(13), autores varchar(256)[], id_funcionario int)
$$
BEGIN
    RETURN QUERY
    SELECT *
    FROM livros l
    WHERE l.id_livro = p_id_livro;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cadastra_livro(titulo varchar(256), editora varchar(256), isbn bpchar(13), autores varchar(256)[], id_funcionario int) RETURNS void AS
$$
BEGIN
    INSERT INTO livros
    VALUES (NEXTVAL('livros_id_livro_seq'), titulo, editora, isbn, autores, id_funcionario);
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cadastra_exemplar(colecao varchar(256), id_livro int, id_funcionario int) RETURNS void AS
$$
BEGIN
    INSERT INTO exemplares
    VALUES (NEXTVAL('exemplares_id_exemplar_seq'), colecao, TRUE, id_livro, id_funcionario);
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_livros() RETURNS TABLE (id_livro int, titulo varchar(256), isbn bpchar(13), autores varchar(256)[], id_funcionario int) AS
$$
BEGIN
    RETURN QUERY SELECT * FROM livros;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_livro(p_id_livro int) RETURNS TABLE (id_livro int, titulo varchar(256), isbn bpchar(13), autores varchar(256)[], id_funcionario int)
$$
BEGIN
    RETURN QUERY
    SELECT *
    FROM livros l
    WHERE l.id_livro = p_id_livro;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cadastra_funcionario(nome varchar(256), cpf bpchar(11), email varchar(256), telefones bpchar(11)[], tipo_funcionario varchar(256)) RETURNS void AS
$$
DECLARE
    id_funcionario int;
BEGIN
    INSERT INTO funcionarios
    VALUES (NEXTVAL('funcionarios_id_funcionario_seq'), nome, cpf, email, telefones, tipo_funcionario);
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cadastra_supervisor(id_supervisor int, id_assistente int) RETURNS void AS
$$
BEGIN
    INSERT INTO supervisao
    VALUES (nextval('supervisao_id_supervisao_seq'), id_supervisor, id_assistente);
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_funcionarios() RETURNS TABLE(id_funcionario int, nome varchar(256), cpf bpchar(11), email varchar(256), telefones bpchar(11)[], tipo_funcionario varchar(256)) AS
$$
BEGIN
    RETURN QUERY SELECT * FROM funcionarios;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_funcionario(p_id_funcionario int) RETURNS TABLE(id_funcionario int, nome varchar(256), cpf bpchar(11), email varchar(256), telefones bpchar(11)[], tipo_funcionario varchar(256)) AS
$$
BEGIN
    RETURN QUERY SELECT *
    FROM funcionarios f
    WHERE f.id_funcionario = p_id_funcionario;
END;
$$
LANGUAGE plpgsql;