SELECT cadastra_usuario(
        "Kalyl Henings",
        "senhaForte@123",
        "12258025982",
        "kalylhenings@gmail.com",
        ARRAY["12345678901"],
        "Casa do Jão",
        3
    );
SELECT cadastra_usuario(
        "Amyr Alan",
        "senhaforte2@123",
        "09924260902",
        "amyr.allan@hotmail.com",
        ARRAY["48996558278"],
        "endereço do mimir",
        1
    );
SELECT cadastra_funcionario(
        "Funcionário Teste 1",
        "12345678901",
        "senhaFunc1",
        "funcionario@hotmail.com",
        ARRAY[ "12345678901",
        "12345678900" ],
        "Bibliotecário"
    );
SELECT cadastra_funcionario(
        "Funcionário Teste2",
        "12345678901",
        "senhaFunc2",
        "funcionario2@hotmail.com",
        ARRAY[ "12345678901",
        "12345678900" ],
        "Assistente"
    );