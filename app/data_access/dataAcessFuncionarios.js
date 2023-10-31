const { pool } = require('./acessoBanco.js')

async function getAll() {
    const cliente = await pool.connect()
    const query = 'SELECT mostra_funcionarios()'
    const resposta = await cliente.query(query)
    cliente.release()
    return resposta.rows
}

async function get(id) {
    const cliente = await pool.connect()
    const query = 'SELECT mostra_funcionario($1)'
    const resposta = await cliente.query(query, [id])
    cliente.release()
    return resposta.rows[0]
}

async function cadastraFuncionario(obj) {
    const cliente = await pool.connect()
    const { nome, cpf, email, tipo_funcionario, telefones } = obj
    const query = 'SELECT cadastra_funcionario($1, $2, $3, $4, $5, $6)'
    await cliente.query(query, [nome, cpf, email, telefones, tipo_funcionario])
    cliente.release()
}

async function cadastraSupervisor(obj) {
    const cliente = await pool.connect()
    const { id_supervior, id_assistente } = obj
    const query = 'SELECT cadastra_supervisor($1, $2)'
    await cliente.query(query, [id_supervisor, id_assistente])
    cliente.release()
}

module.exports = {
    get,
    getAll,
    cadastraFuncionario,
    cadastraSupervisor
}