const usuariosDataAcess = require('../data_access/dataAccessUsuarios')

const timer_multas = setInterval(usuariosDataAcess.geraMultas(), 86400000)