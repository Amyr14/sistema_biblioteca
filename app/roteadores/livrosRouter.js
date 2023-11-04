const dataAccessLivros = require('../data_access/dataAccessLivros')
const express = require('express')
const livrosRouter = express.Router()

livrosRouter.get('/', async (req, res) => {
    try {
        const resposta = await dataAccessLivros.getAll()
        res.status(200).json(resposta)
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})

livrosRouter.get('/:id_livro', async (req, res) => {
    try {
        const id = parseInt(req.params.id_livro)
        const resposta = await dataAccessLivros.get(id)
        res.status(200).json(resposta)
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})

livrosRouter.post('/', async (req, res) => {
    try {
        await dataAccessLivros.cadastraLivro(req.body)
        res.status(200).send('Livro cadastrado com sucesso!')
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    } 
})

module.exports = {
    livrosRouter
}