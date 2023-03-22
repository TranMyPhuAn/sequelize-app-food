'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class restaurants extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate({ rate_res, like_res }) {
      // define association here
      this.hasMany(rate_res, { foreignKey: "res_id" });
      this.hasMany(like_res, { foreignKey: "res_id" });
    }
  }
  restaurants.init({
    res_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
    },
    res_name: DataTypes.STRING,
    image: DataTypes.STRING,
    descs: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'restaurants',
  });
  return restaurants;
};