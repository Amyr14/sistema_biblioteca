const { pool } = require('./acessoBanco')

async function login(obj) {
    const cliente = await pool.connect()
    const { cpf, senha } = obj
    const query = 'SELECT login($1, $2)'
    const resposta = await cliente.query(query, [cpf, senha])
    cliente.release()
    return resposta.rows.map(item => item.login)[0]
}

module.exports = {
    login
}