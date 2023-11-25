require("dotenv").config(); // Configura variáveis de ambiente

const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");

const usuariosRouter = require("./src/roteadores/usuariosRouter");
const livrosRouter = require("./src/roteadores/livrosRouter");
const funcionariosRouter = require("./src/roteadores/funcionariosRouter");
const exemplaresRouter = require("./src/roteadores/exemplaresRouter");
const { login } = require("./src/data_access/dataAccessAuxiliares");
const app = express();
const port = process.env.APPPORT;

app.use(
  cors({
    origin: "*",
    methods: "*",
    allowedHeaders: "*",
  })
);
app.use(bodyParser.json()); // Parseia todo req.body para JSON
app.use("/api/usuarios", usuariosRouter);
app.use("/api/livros", livrosRouter);
app.use("/api/exemplares", exemplaresRouter);
app.use("/api/funcionarios", funcionariosRouter);

app.use("/api/login", async (req, res) => {
  try {
    const resposta = await login(req.body)
    res.status(200).json(resposta)
  } catch (erro) {
    res.status(500).send(`Erro: ${erro}`)
  }
});

app.get("/api", (req, res) => {
  res.status(200).send("API operacional");
});

app.listen(port, () => {
  console.log(`Servidor ouvindo na porta ${port}`);
});
