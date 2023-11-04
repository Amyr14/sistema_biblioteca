CREATE OR REPLACE FUNCTION cadastra_livro(titulo varchar(256), editora varchar(256), isbn char(13), p_autores varchar(256)[], id_funcionario int) RETURNS void AS
$$
DECLARE
    i int;
    id_livro int;
    reg record;
BEGIN
    id_livro := NEXTVAL('livros_seq');

    INSERT INTO livros
    VALUES (id_livro, titulo, editora, isbn, id_funcionario);
    
    -- Itera sobre o array de autores faz as inserções necessárias se o nome não existir no banco
    FOR i IN 1..ARRAY_LENGTH(p_autores, 1) LOOP
        IF NOT EXISTS (SELECT * FROM autores WHERE nome_autor = p_autores[i]) THEN
            INSERT INTO autores VALUES (p_autores[i]);
            INSERT INTO livros_tem_autores VALUES (NEXTVAL('livros_tem_autores_seq'), id_livro, p_autores[i]);
        END IF;
    END LOOP;

END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_livro(p_id_livro int) RETURNS json AS
$$
DECLARE
    resultado json;
BEGIN
    SELECT ROW_TO_JSON(l.*) INTO resultado
    FROM livros l
    WHERE id_livro = p_id_livro;

    RETURN resultado;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostra_livros() RETURNS json AS
$$
DECLARE
    resultado json;
BEGIN
    SELECT JSON_AGG(l.*) INTO resultado
    FROM livros l;

    RETURN resultado;
END;
$$
LANGUAGE plpgsql;