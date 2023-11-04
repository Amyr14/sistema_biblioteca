const { pool } = require('./acessoBanco')

async function getAll() {
    const cliente = await pool.connect()
    const query = 'SELECT mostra_livros()'
    const resposta = await cliente.query(query)
    cliente.release()
    return resposta.rows.flatMap(item => item.mostra_livros)
}

async function get(id) {
    const cliente = await pool.connect()
    const query = 'SELECT mostra_livro($1)'
    const resposta = await cliente.query(query, [id])
    cliente.release()
    return resposta.rows.map(item => item.mostra_livro)
}

async function cadastraLivro(obj) {
    const cliente = await pool.connect()
    const { titulo, editora, isbn, id_funcionario, autores } = obj
    const query = 'SELECT cadastra_livro($1, $2, $3, $4, $5)'
    await cliente.query(query, [titulo, editora, isbn, autores, id_funcionario])
    cliente.release()
}

module.exports = {
    getAll,
    get,
    cadastraLivro,
}
