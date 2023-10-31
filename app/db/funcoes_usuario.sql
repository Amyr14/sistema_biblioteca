
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