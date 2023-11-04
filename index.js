require('dotenv').config() // Configura variáveis de ambiente
const express = require('express')
const bodyParser = require('body-parser')
const { usuariosRouter } = require('./app/roteadores/usuariosRouter')
const { livrosRouter } = require('./app/roteadores/livrosRouter')
const { funcionariosRouter } = require('./app/roteadores/funcionariosRouter')
const { exemplaresRouter } = require('./app/roteadores/exemplaresRouter')
const app = express()
const port = process.env.APP_PORT

app.use(bodyParser.json()) // Parseia todo req.body para JSON
app.use('/usuarios', usuariosRouter)
app.use('/livros', livrosRouter)
app.use('/exemplares', exemplaresRouter)
app.use('/funcionarios', funcionariosRouter)
app.get('/', (req, res) => {
    res.send('API operacional')
})
app.listen(port, () => {console.log(`Servidor ouvindo na porta ${port}`)})