-- Revisar essa função
CREATE OR REPLACE FUNCTION cadastra_exemplar(id_livro int, num_exemplar int, colecao varchar(256), id_funcionario int) RETURNS void AS
$$
BEGIN
    INSERT INTO exemplares
    VALUES (NEXTVAL('exemplares_seq'), num_exemplar, colecao, TRUE, id_livro, id_funcionario);
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION identifica_usuario_com_exemplar(p_id_exemplar int) RETURNS json AS
$$
DECLARE
    hoje date;
    resultado json;
BEGIN
    hoje := NOW()::date;
    
    SELECT ROW_TO_JSON(u.*) INTO resultado
    FROM emprestimos e
    JOIN exemplares ex
    ON (hoje BETWEEN e.data_emprestimo AND e.data_devolucao) AND ex.id_exemplar = p_id_exemplar AND e.id_exemplar = ex.id_exemplar
	JOIN usuarios u
	ON e.id_usuario = u.id_usuario;

    RETURN resultado;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_exemplares() RETURNS json AS
$$
DECLARE
    resultado json;
BEGIN
    SELECT JSON_AGG(e.*) INTO resultado
    FROM exemplares e;

    RETURN resultado;
END;
$$
LANGUAGE plpgsql;