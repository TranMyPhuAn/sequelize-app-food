// Kết nối CSDL
const { Sequelize } = require("sequelize");


const config = require("../config/config");

const sequelize = new Sequelize(config.database, config.userName, config.pass, {
  host: config.host,
  port: config.port,
  dialect: config.dialect,
});


module.exports = sequelize;