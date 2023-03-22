'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class rate_res extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate({ users, restaurants }) {
      // define association here
      this.belongsTo(users, { foreignKey: "user_id" });
      this.belongsTo(restaurants, { foreignKey: "res_id" });
    }
  }
  rate_res.init({
    user_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      // allowNull: false,
    },
    res_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      // allowNull: false,
    },
    amount: DataTypes.INTEGER,
    date_rate: {
      type: DataTypes.DATE,
      defaultValue: sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    sequelize,
    modelName: 'rate_res',
  });
  return rate_res;
};