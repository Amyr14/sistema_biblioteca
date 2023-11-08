require("dotenv").config(); // Configura variáveis de ambiente

express = require("express");
json = require("body-parser");
cors = require("cors");

usuariosRouter = require("./src/roteadores/usuariosRouter");
livrosRouter = require("./src/roteadores/livrosRouter");
funcionariosRouter = require("./src/roteadores/funcionariosRouter");
exemplaresRouter = require("./src/roteadores/exemplaresRouter");

const app = express();
const port = process.env.APPPORT;

app.use(
  cors({
    origin: "*",
    methods: "*",
    allowedHeaders: "*",
  })
);
//app.use(json()); // Parseia todo req.body para JSON
app.use("/api/usuarios", usuariosRouter);
app.use("/api/livros", livrosRouter);
app.use("/api/exemplares", exemplaresRouter);
app.use("/api/funcionarios", funcionariosRouter);
app.get("/api", (req, res) => {
  res.status(200).send("API operacional");
});

app.listen(port, () => {
  console.log(`Servidor ouvindo na porta ${port}`);
});
