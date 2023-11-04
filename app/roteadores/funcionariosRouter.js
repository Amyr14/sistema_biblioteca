const express = require('express')
const dataAccessFuncionarios = require('../data_access/dataAccessFuncionarios')
const funcionariosRouter = express.Router()

funcionariosRouter.get('/', async (req, res) => {
    try {
        const resposta = await dataAccessFuncionarios.getAll()
        res.status(200).json(resposta)
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})

funcionariosRouter.get('/:id_funcionario', async (req, res) => {
    try {
        const id = parseInt(req.params.id_funcionario)
        const resposta = await dataAccessFuncionarios.get(id)
        res.status(200).json(resposta)
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})

funcionariosRouter.post('/', async (req, res) => {
    try {
        await dataAccessFuncionarios.cadastraFuncionario(req.body)
        res.status(200).send('Funcinário cadastrado!')
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})

funcionariosRouter.post('/supervisores', async (req, res) => {
    try {
        await dataAccessFuncionarios.cadastraSupervisor(req.body)
        res.status(200).send('Supervisor cadastrado com sucesso!')
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})

funcionariosRouter.get('/supervisores', async (req, res) => {
    try {
        const resposta = await dataAccessFuncionarios.mostraSupervisores()
        res.status(200).json(resposta)
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})

module.exports = {
    funcionariosRouter
}