require('dotenv').config()
const nodemailer = require('nodemailer')
const { email, senhaEmail } = { email: process.env.EMAIL, senhaEmail: process.env.SENHA_EMAIL}

const transportador = nodemailer.createTransport({
    service: 'Outlook',
    auth: {
      user: email,
      pass: senhaEmail,
    },
})

function mandarEmail(emailUsuario, senha) {
    const emailConfig = {
        from: email,
        to: emailUsuario,
        subject: 'Sua senha',
        text: senha
    }
    transportador.sendMail(emailConfig, (erro, info) => {
        if (erro) throw `Erro ao mandar o email: ${erro}`
    })
}

module.exports = {
    mandarEmail
}