const { pool } = require('./acessoBanco')

async function cadastraExemplar(obj) {
    const cliente = await pool.connect()
    const { id_livro, num_exemplar, colecao, id_funcionario } = obj
    const query = 'SELECT cadastra_exemplar($1, $2, $3, $4)'
    await cliente.query(query, [id_livro, num_exemplar, colecao, id_funcionario])
    cliente.release()
}

async function mostraUsuarioComExemplar(idUsuario) {
    const cliente = await pool.connect()
    const query = 'SELECT mostra_usuario_com_exemplar($1)'
    const resposta = await cliente.query(query, [idUsuario])
    cliente.release()
    return resposta.rows.map(item => item.mostra_usuario_com_exemplar)
}

async function getAll() {
    const cliente = await pool.connect()
    const query = 'SELECT mostra_exemplares()'
    const resposta = await cliente.query(query)
    cliente.release()
    return resposta.rows.flatMap(item => item.mostra_exemplares)
}

module.exports = {
    cadastraExemplar,
    mostraUsuarioComExemplar,
    getAll
}