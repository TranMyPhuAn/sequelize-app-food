'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class orders extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate({ users, foods }) {
      // define association here
      this.belongsTo(users, { foreignKey: "user_id"});
      this.belongsTo(foods, { foreignKey: "food_id"});
    }
  }
  orders.init({
    user_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
    },
    food_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
    },
    amount: DataTypes.INTEGER,
    code: DataTypes.STRING,
    arr_sub_id: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'orders',
  });
  return orders;
};