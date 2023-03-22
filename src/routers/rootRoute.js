const express = require("express");
const rootRoute = express.Router();

const { userLikeRoute } = require("./userLikeRoute");
const { userResRoute } = require("./userResRoute");
const { orderRoute } = require("./orderRoute");

rootRoute.use("/user-like", userLikeRoute);
rootRoute.use("/user-res", userResRoute);
rootRoute.use("/order", orderRoute);



module.exports = {
    rootRoute
}
