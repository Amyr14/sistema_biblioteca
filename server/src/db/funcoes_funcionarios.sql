CREATE OR REPLACE FUNCTION cadastra_funcionario(nome varchar(256), cpf char(11), email varchar(256), telefones char(11)[], tipo_funcionario varchar(256)) RETURNS void AS
$$
BEGIN
    INSERT INTO funcionarios
    VALUES (NEXTVAL('funcionarios_seq'), nome, cpf, email, telefones, tipo_funcionario);
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cadastra_supervisor(id_supervisor int, id_assistente int) RETURNS void AS
$$
BEGIN
    INSERT INTO supervisao
    VALUES (NEXTVAL('supervisao_seq'), id_supervisor, id_assistente);
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_funcionarios() RETURNS json AS
$$
DECLARE
    resultado json;
BEGIN
    SELECT JSON_AGG(f.*) INTO resultado
    FROM funcionarios f;

    RETURN resultado;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_funcionario(p_id_funcionario int) RETURNS json AS
$$
DECLARE
    resultado json;
BEGIN
    SELECT ROW_TO_JSON(f.*) INTO resultado
    FROM funcionarios f
    WHERE f.id_funcionario = p_id_funcionario;

    RETURN resultado;
END;
$$
LANGUAGE plpgsql;

-- Mostra supervisores e respectivos supervisionados
CREATE OR REPLACE FUNCTION mostra_supervisores() RETURNS json AS
$$
DECLARE
    resultado json;
BEGIN
    SELECT JSON_AGG(t.*) INTO resultado
    FROM (SELECT id_bibliotecario, ARRAY_AGG(s.id_assistente) AS assistentes
	      FROM supervisao s
	      GROUP BY id_bibliotecario) t;

    RETURN resultado;
END;
$$
LANGUAGE plpgsql;