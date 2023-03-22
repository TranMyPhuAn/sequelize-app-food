const initModels = require("../models/init-models");
const sequelize = require("../models/index");
const model = initModels(sequelize);

const { failCode, errorCode, successCode } = require("../config/response");

// Thêm đánh giá nhà hàng
const evaluateRes = async (req, res) => {
    // const { res_id } = req.query;
    const { res_id } = req.params;
    const { user_id, amount } = req.body;
    try {
        // kiểm tra xem đã có đánh giá chưa
        const currentRes = await model.rate_res.findOne({
            where: {
                user_id,
                res_id
            }
        });
        if(currentRes){
            return errorCode(res, currentRes, "Bạn đã đánh giá nhà hàng này rồi");
        }
        // kiểm tra đánh giá trong khoảng 1 - 5 sao
        if(amount < 1 || amount > 5){
            return errorCode(res, currentRes, "Bạn vui lòng chọn 1-5 sao");
        }

        const newRes = await model.rate_res.create({ user_id, res_id, amount });
        successCode(res, newRes, "Thêm đánh giá thành công");
    } catch (error) {
        failCode(res, "Lỗi BE");
    }
}

// Lấy danh sách đánh giá theo nhà hàng và user
const listRes = async (req, res) => {
    try {
        const listRestaurant = await model.rate_res.findAll({
            include: ["user","re"]
        });
        successCode(res, listRestaurant, "Danh sách đánh giá theo nhà hàng và user");
    } catch (error) {
        failCode(res, "Lỗi BE");
    }
}

// id user đã đánh giá nhà hàng
const userRateRes = async (req, res) => {
    const { user_id } = req.params;
    try {
        const listLike = await model.rate_res.findAll({
            where: {
                user_id
            },
            include: ["user","re"]
        });
        if (listLike == '') {
        return errorCode(res, listLike, "Bạn cần có ít nhất 1 rated để hiển thị");//3
        }
    
        successCode(res, listLike, "Danh sách user đã đánh giá nhà hàng");
    } catch (error) {
        failCode(res, "Lỗi BE");
    }
}

// id nhà hàng được đánh giá
const listResRate = async (req, res) => {
    const { res_id } = req.params;
    try {
        const listLike = await model.rate_res.findAll({
            where: {
                res_id
            },
            include: ["re","user"]
        });
        if (listLike == '') {
        return errorCode(res, listLike, "Nhà hàng chưa có rated nào"); //4
        }
    
        successCode(res, listLike, "Danh sách các lượt đánh giá của nhà hàng");
    } catch (error) {
        failCode(res, "Lỗi BE");
    }
}




module.exports = {
    evaluateRes,
    listRes,
    userRateRes,
    listResRate
}