const express = require("express");
const { likeRes, unlikeRes, listLike, userLikeRes, listResLike } = require("../controllers/userLikeController");
const userLikeRoute = express.Router();


userLikeRoute.post("/like-res", likeRes);
userLikeRoute.post("/unlike-res", unlikeRes);
userLikeRoute.get("/list-like", listLike);

userLikeRoute.get("/user-like-res/:user_id", userLikeRes);
userLikeRoute.get("/list-res-like/:res_id", listResLike);


module.exports = {
    userLikeRoute
}