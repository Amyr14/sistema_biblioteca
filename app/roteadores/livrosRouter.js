const livrosDataAcess = require('../data_acess/livrosDataAcess')
const express = require('express')
const livrosRouter = express.Router()

livrosRouter.get('/', async (req, res) => {
    try {
        const resposta = await livrosDataAcess.getAll()
        res.status(200).json(resposta)
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})

livrosRouter.get('/:id_livro', async (req, res) => {
    try {
        const id = parseInt(req.params.id_livro)
        const resposta = await livrosDataAcess.get(id)
        res.status(200).json(resposta)
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})

livrosRouter.post('/', async (req, res) => {
    try {
        const obj = JSON.parse(req.body)
        await livrosDataAcess.cadastraLivro(obj)
        res.status(200).send('Livro cadastrado com sucesso!')
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    } 
})

livrosRouter.post('/exemplares', async (req, res) => {
    try {
        const obj = JSON.parse(req.body)
        await livrosDataAcess.cadastraExemplar(obj)
        res.status(200).send('Exemplar cadastrado com sucesso!')
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})