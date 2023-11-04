const express = require('express')
const dataAccessUsuarios = require('../data_access/dataAccessUsuarios')
const usuariosRouter = express.Router()

usuariosRouter.get('/', async (req, res) => {
  try {
    const resposta = await dataAccessUsuarios.getAll()
    res.status(200).json(resposta)
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

usuariosRouter.get('/:id_usuario', async (req, res) => {
  try {
    const id = parseInt(req.params.id_usuario)
    const resposta = await dataAccessUsuarios.get(id)
    res.status(200).json(resposta)
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

// Implementar essa função
// usuariosRouter.delete('/:id_usuario', async (req, res) => {
//  try {
//    const id = parseInt(req.params.id_usuario)
//    await dataAccessUsuarios.removeUsuario(id)
//    res.status(200).send('Usuário deletado com sucesso!')
//  } catch (erro) {
//    res.status(500).send(`Erro: ${erro.message}`)
//  }
//})

usuariosRouter.post('/', async (req, res) => {
  try {
    await dataAccessUsuarios.cadastraUsuario(req.body)
    res.status(200).send('Usuário cadastrado com sucesso!')
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

usuariosRouter.post('/:id_usuario/emprestimos', async (req, res) => {
  try {
    await dataAccessUsuarios.realizaEmprestimo(req.body)
    res.status(200).send('Emprestimo realizado com sucesso!')
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

usuariosRouter.post('/:id_usuario/reservas', async (req, res) => {
  try {
    await dataAccessUsuarios.realizaReserva(req.body) 
    res.status(200).send('Reserva realizada com sucesso!')
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

usuariosRouter.put('/:id_usuario/emprestimos', async (req, res) => {
  try {
    const { tipo } = req.body
    if ( tipo === 'Renovação') {
      await dataAccessUsuarios.renovaEmprestimo(req.body)
      res.status(200).send('Empréstimo renovado com sucesso!')
    } else if ( tipo == 'Resolução') {
      await dataAccessUsuarios.resolveEmprestimo(req.body)
      res.status(200).send('Empréstimo resolvido com sucesso!')
    }
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

usuariosRouter.get('/:id_usuario/emprestimos', async (req, res) => {
  try {
    const id = parseInt(req.params.id_usuario)
    const resposta = await dataAccessUsuarios.mostraEmprestimosUsuario(id)
    res.status(200).json(resposta)
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

usuariosRouter.get('/:id_usuario/multas', async (req, res) => {
  try {
    const id = parseInt(req.params.id_usuario)
    const resposta = await dataAccessUsuarios.mostraMultasUsuario(id)
    res.status(200).json(resposta)
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

usuariosRouter.put('/:id_usuario/multas', async (req, res) => {
  try {
    await dataAccessUsuarios.resolveMulta(req.body)
    res.status(200).send('Multa resolvida com sucesso!')
  } catch (erro) {
    res.status(500).send(`Erro: ${erro.message}`)
  }
})

module.exports = { usuariosRouter }