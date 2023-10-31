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