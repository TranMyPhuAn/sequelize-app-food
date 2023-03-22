const express = require("express");
const orderRoute = express.Router();

const { order } = require("../controllers/orderController");

orderRoute.post("/add-order", order);



module.exports = {
    orderRoute
}