'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class foods extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate({ food_type, sub_food }) {
      // define association here
      this.belongsTo(food_type, { foreignKey: "type_id" });
      this.hasMany(sub_food, { foreignKey: "food_id"});
    }
  }
  foods.init({
    food_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
    },
    food_name: DataTypes.STRING,
    image: {
      type: DataTypes.STRING,
      defaultValue: 'https://picsum.photos/1000'
    },
    price: DataTypes.FLOAT,
    des_cription: DataTypes.STRING,
    type_id: {
      type: DataTypes.INTEGER,
    },
  }, {
    sequelize,
    modelName: 'foods',
  });
  return foods;
};