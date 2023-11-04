const express = require('express')
const dataAccessExemplares = require('../data_access/dataAccessExemplares')
const exemplaresRouter = express.Router()

exemplaresRouter.post('/', async (req, res) => {
    try {
        await dataAccessExemplares.cadastraExemplar(req.body)
        res.status(200).send('Exemplar cadastrado com sucesso!')
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})

exemplaresRouter.get('/localizar/:id_exemplar', async (req, res) => {
    try {
        const id = parseInt(req.params.id_exemplar)
        const resposta = await dataAccessExemplares.mostraUsuarioComExemplar(id)
        res.status(200).json(resposta)
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})

exemplaresRouter.get('/', async (req, res) => {
    try {
        const resposta = await dataAccessExemplares.getAll()
        res.status(200).json(resposta)
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})

module.exports = {
    exemplaresRouter
}