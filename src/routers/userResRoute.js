const express = require("express");
const { evaluateRes, listRes, userRateRes, listResRate } = require("../controllers/userResController");
const userResRoute = express.Router();


userResRoute.post("/evaluate-res/:res_id", evaluateRes);
userResRoute.get("/list-res", listRes);

userResRoute.get("/user-rate-res/:user_id", userRateRes);
userResRoute.get("/list-res-rate/:res_id", listResRate);


module.exports = {
    userResRoute
}