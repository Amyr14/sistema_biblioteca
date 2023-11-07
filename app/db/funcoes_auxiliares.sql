CREATE OR REPLACE FUNCTION login(p_cpf char(11), p_senha varchar(256)) RETURNS json AS
$$
DECLARE
	resultado json;
BEGIN
	SELECT ROW_TO_JSON(u.*) INTO resultado
	FROM (SELECT id_usuario
		  FROM usuarios
		  WHERE cpf = p_cpf AND senha = p_senha) u;
		  
	IF FOUND THEN
		RETURN resultado;
	END IF;
	
	SELECT ROW_TO_JSON(f.*) INTO resultado
	FROM (SELECT id_funcionario
		  FROM funcionarios
		  WHERE cpf = p_cpf AND senha = p_senha) f;
	
	IF FOUND THEN
		RETURN resultado;
	END IF;
	
	RETURN resultado;
END;
$$
LANGUAGE plpgsql;