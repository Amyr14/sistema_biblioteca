const { pool } = require('./acessoBanco.js')

async function getAll() {
    const cliente = await pool.connect()
    const query = 'SELECT mostra_usuarios()'
    const resposta = await cliente.query(query)
    cliente.release()
    return resposta.rows
}

async function get(id) {
    const cliente = await pool.connect()
    const query = 'SELECT mostra_usuario($1)'
    const resposta = await cliente.query(query, [id])
    cliente.release()
    return resposta.rows[0]
}

async function cadastraUsuario(obj) {
    const cliente = await pool.connect()
    const { nome, cpf, email, endereco, id_categoria, telefones } = obj
    const query = 'SELECT cadastra_usuario($1, $2, $3, $4, $5, $6)'
    await cliente.query(query, [nome, cpf, email, endereco, telefones, id_categoria])
    cliente.release()
}

async function realizaEmprestimo(obj) {
    const cliente = await pool.connect()
    const { id_usuario, id_exemplar } = obj
    const query = 'SELECT emprestimo($1, $2)'
    await cliente.query(query, [id_usuario, id_exemplar])
    cliente.release()
}

async function realizaReserva(obj) {
    const cliente = await pool.connect()
    const { id_usuario, id_exemplar } = obj
    const query = 'SELECT reserva($1, $2)'
    await cliente.query(query, [id_usuario, id_exemplar])
    cliente.release()
}

async function resolveMulta(obj) {
    const cliente = await pool.connect()
    const { id_multa } = obj
    const query = 'SELECT resolve_multa($1)'
    await cliente.query(query, [id_multa])
    cliente.release()
}

async function resolveEmprestimo(obj) {
    const cliente = await pool.connect()
    const { id_emprestimo } = obj
    const query = 'SELECT resolve_emprestimo($1)'
    await cliente.query(query, [id_emprestimo])
    cliente.release()
}

async function renovaEmprestimo(obj) {
    const cliente = await pool.connect()
    const { id_emprestimo } = obj
    const query = 'SELECT renova_emprestimo($1)'
    await cliente.query(query, [id_emprestimo])
    cliente.release()
}

async function mostraMultasUsuario(id) {
    const cliente = await pool.connect()
    const query = 'SELECT mostra_multas_usuario($1)'
    await cliente.query(query, [id])
    cliente.release()
}

async function mostraEmprestimosUsuario(id) {
    const cliente = await pool.connect()
    const query = 'SELECT mostra_emprestimos_usuario($1)'
    await cliente.query(query, [id])
    cliente.release()
}

module.exports = {
    getAll,
    get,
    cadastraUsuario,
    realizaEmprestimo,
    realizaReserva,
    resolveMulta,
    resolveEmprestimo,
    renovaEmprestimo,
    mostraEmprestimosUsuario,
    geraMultas,
    mostraMultasUsuario
}