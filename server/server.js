require('dotenv').config() // Configura variáveis de ambiente
console.log(__dirname)
import express from 'express'
import { json } from 'body-parser'
import { usuariosRouter } from './src/roteadores/usuariosRouter'
import { livrosRouter } from './src/roteadores/livrosRouter'
import { funcionariosRouter } from './src/roteadores/funcionariosRouter'
import { exemplaresRouter } from './src/roteadores/exemplaresRouter'
const app = express()
const port = process.env.APPPORT

app.use(json()) // Parseia todo req.body para JSON
app.use('/api/usuarios', usuariosRouter)
app.use('/api/livros', livrosRouter)
app.use('/api/exemplares', exemplaresRouter)
app.use('/api/funcionarios', funcionariosRouter)
app.get('/api', (req, res) => {
    res.status(200).send('API operacional')
})

app.listen(port, () => {console.log(`Servidor ouvindo na porta ${port}`)})