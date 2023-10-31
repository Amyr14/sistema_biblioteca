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