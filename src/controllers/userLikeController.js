// const { users } = require("../../models/index");
const initModels = require("../models/init-models");
const sequelize = require("../models/index");
const model = initModels(sequelize);

const { errorCode, failCode, successCode } = require("../config/response");

// like nhà hàng
const likeRes = async (req, res) => {
    const { user_id, res_id } = req.body;
    try {
        //Kiểm tra xem đã có like chưa
        const currentLike = await model.like_res.findOne({
            where: {
                user_id,
                res_id
            }, 
        });
        if(currentLike){
            return errorCode(res, currentLike, "Bạn đã like nhà hàng này rồi");
            
        }
        // Tạo like mới
        const newLike = await model.like_res.create({ user_id, res_id });
        successCode(res, newLike, "Like nhà hàng thành công");
    } catch (error) {
        failCode(res, "Lỗi BE");
    };
};

// unlike nhà hàng
const unlikeRes = async (req, res) => {
    const { user_id, res_id } = req.body;
    try {
        const deleteLike = await model.like_res.destroy({
            where: {
                user_id,
                res_id
            }
        });
        // console.log(deleteLike)
        if(deleteLike === 0){
            return errorCode(res, deleteLike, "Nhà hàng chưa được like");
        }
        successCode(res, deleteLike, "Bỏ thích nhà hàng thành công");
    } catch (error) {
        failCode(res, "Lỗi BE");
    }
};

// Lấy danh sách like nhà hàng theo user
const listLike = async (req, res) => {
    try {
        const likes = await model.like_res.findAll({
            include: ["user","re"]
        });

        successCode(res, likes, "Danh sách các lượt like của nhà hàng theo user");
    } catch (error) {
        failCode(res, "Lỗi BE");
    }
};

// id user đã like nhà hàng
const userLikeRes = async (req, res) => {
    const { user_id } = req.params;
    try {
        const listLike = await model.like_res.findAll({
            where: {
                user_id
            },
            include: ["user","re"]
        });
        // Kiểm tra user đã like nhà hàng nào chưa
        if (listLike == '') {
        return errorCode(res, listLike, "Bạn cần có ít nhất 1 like để hiển thị");//1
        }
    
        successCode(res, listLike, "Danh sách bạn đã like các nhà hàng");
    } catch (error) {
        failCode(res, "Lỗi BE");
    }
};


// id nhà hàng được user like
const listResLike = async (req, res) => {
    const { res_id } = req.params;
    try {
        const listLike = await model.like_res.findAll({
            where: {
                res_id
            },
            include: ["re","user"]
        });
        // Kiểm tra lượt like của nhà hàng
        if (listLike == '') {
        return errorCode(res, listLike, "Nhà hàng chưa có lượt thích nào"); //11
        }
    
        successCode(res, listLike, "Danh sách user đã like nhà hàng của bạn");
    } catch (error) {
        failCode(res, "Lỗi BE");
    }
}

module.exports = {
    likeRes,
    unlikeRes,
    listLike,
    userLikeRes,
    listResLike
}