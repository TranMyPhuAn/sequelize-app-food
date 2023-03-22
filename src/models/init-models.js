const DataTypes = require("sequelize").DataTypes;
const _SequelizeMeta = require("./SequelizeMeta");
const _food_type = require("./food_type");
const _foods = require("./foods");
const _like_res = require("./like_res");
const _orders = require("./orders");
const _rate_res = require("./rate_res");
const _restaurants = require("./restaurants");
const _sub_food = require("./sub_food");
const _users = require("./users");

function initModels(sequelize) {
  const SequelizeMeta = _SequelizeMeta(sequelize, DataTypes);
  const food_type = _food_type(sequelize, DataTypes);
  const foods = _foods(sequelize, DataTypes);
  const like_res = _like_res(sequelize, DataTypes);
  const orders = _orders(sequelize, DataTypes);
  const rate_res = _rate_res(sequelize, DataTypes);
  const restaurants = _restaurants(sequelize, DataTypes);
  const sub_food = _sub_food(sequelize, DataTypes);
  const users = _users(sequelize, DataTypes);

  foods.belongsToMany(users, { as: 'user_id_users_orders', through: orders, foreignKey: "food_id", otherKey: "user_id" });
  restaurants.belongsToMany(users, { as: 'user_id_users', through: like_res, foreignKey: "res_id", otherKey: "user_id" });
  restaurants.belongsToMany(users, { as: 'user_id_users_rate_res', through: rate_res, foreignKey: "res_id", otherKey: "user_id" });
  users.belongsToMany(foods, { as: 'food_id_foods', through: orders, foreignKey: "user_id", otherKey: "food_id" });
  users.belongsToMany(restaurants, { as: 'res_id_restaurants', through: like_res, foreignKey: "user_id", otherKey: "res_id" });
  users.belongsToMany(restaurants, { as: 'res_id_restaurants_rate_res', through: rate_res, foreignKey: "user_id", otherKey: "res_id" });
  foods.belongsTo(food_type, { as: "type", foreignKey: "type_id"});
  food_type.hasMany(foods, { as: "foods", foreignKey: "type_id"});
  orders.belongsTo(foods, { as: "food", foreignKey: "food_id"});
  foods.hasMany(orders, { as: "orders", foreignKey: "food_id"});
  sub_food.belongsTo(foods, { as: "food", foreignKey: "food_id"});
  foods.hasMany(sub_food, { as: "sub_foods", foreignKey: "food_id"});
  like_res.belongsTo(restaurants, { as: "re", foreignKey: "res_id"});
  restaurants.hasMany(like_res, { as: "like_res", foreignKey: "res_id"});
  rate_res.belongsTo(restaurants, { as: "re", foreignKey: "res_id"});
  restaurants.hasMany(rate_res, { as: "rate_res", foreignKey: "res_id"});
  like_res.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(like_res, { as: "like_res", foreignKey: "user_id"});
  orders.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(orders, { as: "orders", foreignKey: "user_id"});
  rate_res.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(rate_res, { as: "rate_res", foreignKey: "user_id"});

  return {
    SequelizeMeta,
    food_type,
    foods,
    like_res,
    orders,
    rate_res,
    restaurants,
    sub_food,
    users,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
