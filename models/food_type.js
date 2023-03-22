'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class food_type extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate({ foods }) {
      // define association here
      this.hasMany(foods, { foreignKey: "type_id"})
    }
  }
  food_type.init({
    type_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
    },
    type_name: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'food_type',
  });
  return food_type;
};