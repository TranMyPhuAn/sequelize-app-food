require('dotenv').config();

// console.log(process.env)
// node src/config/config.js

// yarn add dotevn

module.exports = {
    host:       process.env.HOST,
    userName:   process.env.USER,
    pass:       process.env.PASS,
    port:       process.env.PORT,
    dialect:    process.env.DIALECT,
    database:   process.env.DATABASE,
}