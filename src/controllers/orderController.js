const initModels = require("../models/init-models");
const sequelize = require("../models/index");
const model = initModels(sequelize);

const { successCode, errorCode, failCode } = require("../config/response");

const order = async (req, res) => {
  const { user_id, food_id, amount, code, arr_sub_id } = req.body;
  try {
    const orderInfo = {
      user_id,
      food_id,
      amount,
      code,
      arr_sub_id,
    };

    // kiểm tra thông tin đặt hàng
    if (!user_id || !food_id || !amount) {
      return res.status(400).send("Thông tin đặt hàng không hợp lệ");
    }

    // Kiểm tra xem user và food có tồn lại không
    const user = await model.users.findByPk(user_id);
    const food = await model.foods.findByPk(food_id);
    if (!user || !food) {
      return res.status(400).send("user hoặc food không tìm thấy");
    }

    // Kiểm tra xem bạn đã đặt món này chưa
    const userId = await model.orders.findOne({
      where: {
        user_id,
        food_id,
      },
    });
    if (userId) {
      return res
        .status(400)
        .send("Món này bạn đã đặt rồi cần tăng lên số lượng");
    }

    // Tạo mới order
    const newOrder = await model.orders.create(orderInfo);
    // res.status(200).send(newOrder);
    successCode(res, newOrder, "Thêm món thành công");
  } catch (error) {
    failCode(res, "Lỗi BE!");
  }
};

module.exports = {
  order,
};
