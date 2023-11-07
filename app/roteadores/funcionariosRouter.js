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

funcionariosRouter.get('/supervisores', async (req, res) => {
    try {
        const resposta = await dataAccessFuncionarios.mostraSupervisores()
        res.status(200).json(resposta)
    } catch (erro) {
        console.log(erro)
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

funcionariosRouter.get('/:id_funcionario/esqueceu_senha', async (req, res) => {
    try {
      const id = parseInt(req.params.id_funcionario)
      const resposta = await dataAccessFuncionarios.get(id)
      const { email, senha } = resposta[0]
      mandarEmail(email, senha)
      res.status(200).send(`Senha enviada para ${email}`)
    } catch (erro) {
      res.status(500).send(`Erro: ${erro.message}`)
    }
  })

module.exports = {
    funcionariosRouter
}