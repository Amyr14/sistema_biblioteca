const express = require('express')
const funcionariosController = require('../data_acess/funcionariosDataAcess')
const router = express.Router()

router.get('/', async (req, res) => {
    try {
        const resposta = await funcionariosDataAcess.getAll()
        res.status(200).json(resposta)
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})

router.get('/:id_funcionario', async (req, res) => {
    try {
        const id = parseInt(req.params.id_funcionario)
        const resposta = await funcionariosDataAcess.get(id)
        res.status(200).json(resposta)
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})

router.post('/', async (req, res) => {
    try {
        const obj = JSON.parse(req.body)
        await funcionariosDataAcess.cadastraFuncionario(obj)
        res.status(200).send('Funcinário cadastrado!')
    } catch (erro) {-
        res.status(500).send(`Erro: ${erro.message}`)
    }
})

router.post('/supervisao', async (req, res) => {
    try {
        const obj = JSON.parse(req.body)
        await funcionariosDataAcess.cadastraSupervisor(obj)
        res.status(200).send('Supervisor cadastrado com sucesso!')
    } catch (erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})