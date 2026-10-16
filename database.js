
const sqlite3 = require('sqlite3').verbose();
const path = require('path');

const db = new sqlite3.Database(
    path.join(__dirname, 'banco.db'),
    (erro) => {
        if (erro) {
            console.log('Erro ao conectar:', erro.message);
        } else {
            console.log('Banco de dados conectado!');
        }
    }
);

db.run('PRAGMA foreign_keys = ON');

module.exports = db;
