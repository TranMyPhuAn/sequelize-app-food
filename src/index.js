const express = require("express");
const cors = require("cors");
const {sequelize} = require("../models/index");
const { rootRoute } = require("./routers/rootRoute");
const post = 9090;

const app = express();
app.use(express.json());
app.use(cors());

app.listen(post, () => {
    console.log(`http://localhost:${post}`)
});

try {
    sequelize.authenticate();
    console.log("Kết nối thành công");
} catch (error) {
    console.log("thất bại", error)
}

app.use("/api", rootRoute);
