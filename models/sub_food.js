'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class sub_food extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate({ foods }) {
      // define association here
      this.belongsTo(foods, { foreignKey: "food_id"})
    }
  }
  sub_food.init({
    sub_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
    },
    sub_name: DataTypes.STRING,
    sub_price: DataTypes.FLOAT,
    food_id: {
      type: DataTypes.INTEGER
    },
  }, {
    sequelize,
    modelName: 'sub_food',
  });
  return sub_food;
};