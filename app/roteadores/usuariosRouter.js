const express = require('express')
const usuariosDataAcess = require('../data_access/dataAccessUsuarios')
const usuariosRouter = express.Router()

usuariosRouter.get('/', async (req, res) => {
  try {
    const resposta = await usuariosDataAcess.getAll()
    res.status(200).json(resposta)
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

usuariosRouter.get('/:id_usuario', async (req, res) => {
  try {
    const id = parseInt(req.params.id_usuario)
    const resposta = await usuariosDataAcess.get(id)
    res.status(200).json(resposta)
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

// Implementar essa função
usuariosRouter.delete('/:id_usuario', async (req, res) => {
  try {
    const id = parseInt(req.params.id_usuario)
    await usuariosDataAcess.removeUsuario(id)
    res.status(200).send('Usuário deletado com sucesso!')
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

usuariosRouter.post('/', async (req, res) => {
  try {
    const obj = JSON.parse(req.body)
    await usuariosDataAcess.cadastraUsuario(obj)
    res.status(200).send('Usuário cadastrado com sucesso!')
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

usuariosRouter.post('/:id_usuario/emprestimos', async (req, res) => {
  try {
    const obj = JSON.parse(req.body)
    await usuariosDataAcess.realizaEmprestimo(obj)
    res.status(200).send('Emprestimo realizado com sucesso!')
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

usuariosRouter.post('/:id_usuario/reservas', async (req, res) => {
  try {
    const obj = JSON.parse(req.body)
    await usuariosDataAcess.realizaReserva(obj) 
    res.status(200).send('Reserva realizada com sucesso!')
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

usuariosRouter.put('/:id_usuario/emprestimos', async (req, res) => {
  try {
    const obj = JSON.parse(req.body)
    const { tipo } = obj
    if ( tipo === 'Renovação') {
      await usuariosDataAcess.renovaEmprestimo(obj)
      res.status(200).send('Empréstimo renovado com sucesso!')
    } else if ( tipo == 'Resolução') {
      await usuariosDataAcess.resolveEmprestimo(obj)
      res.status(200).send('Empréstimo resolvido com sucesso!')
    }
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

usuariosRouter.get('/:id_usuario/emprestimos', async (req, res) => {
  try {
    const id = parseInt(req.params.id_usuario)
    const resposta = await usuariosDataAcess.mostraEmprestimosUsuario(id)
    res.status(200).json(resposta)
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

usuariosRouter.get('/:id_usuario/multas', async (req, res) => {
  try {
    const id = parseInt(req.params.id_usuario)
    const resposta = await usuariosDataAcess.mostraMultasUsuario(id)
    res.status(200).json(resposta)
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

usuariosRouter.put('/:id_usuario/multas', async (req, res) => {
  try {
    const obj = JSON.parse(req.body)
    await usuariosDataAcess.resolveMulta(obj)
    res.status(200).send('Multa resolvida com sucesso!')
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

module.exports = { usuariosRouter }