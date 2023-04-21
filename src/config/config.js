require('dotenv').config();

// console.log(process.env)
// node src/config/config.js

// yarn add dotevn

module.exports = {
    host:       process.env.DB_HOST,
    userName:   process.env.DB_USERNAME,
    pass:       process.env.DB_PASS,
    port:       process.env.DB_PORT,
    dialect:    process.env.DB_DIALECT,
    database:   process.env.DB_DATABASE,
}