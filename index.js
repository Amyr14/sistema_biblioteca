require('dotenv').config() // Configura variáveis de ambiente
const express = require('express')
const bodyParser = require('body-parser')
const { usuariosRouter } = require('./app/roteadores/usuariosRouter')
const { livrosRouter } = require('./app/roteadores/livrosRouter')
const { funcionariosRouter } = require('./app/roteadores/funcionariosRouter')
const { exemplaresRouter } = require('./app/roteadores/exemplaresRouter')
const { login } = require('./app/data_access/dataAccessAuxiliares')
const port = process.env.APP_PORT
const app = express()

app.use(bodyParser.json()) // Parseia todo req.body para JSON
app.get('/', (req, res) => {
    res.send('API operacional')
})
app.get('/login', async (req, res) => {
    try {
        const resposta = await login(req.body)
        res.status(200).json(resposta)
    } catch(erro) {
        res.status(500).send(`Erro: ${erro.message}`)
    }
})
app.use('/usuarios', usuariosRouter)
app.use('/livros', livrosRouter)
app.use('/exemplares', exemplaresRouter)
app.use('/funcionarios', funcionariosRouter)
app.listen(port, () => {console.log(`Servidor ouvindo na porta ${port}`)})