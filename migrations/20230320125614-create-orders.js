'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('orders', {
      // id: {
      //   allowNull: false,
      //   autoIncrement: true,
      //   primaryKey: true,
      //   type: Sequelize.INTEGER
      // },
      user_id: {
        type: Sequelize.INTEGER,
        // allowNull: false,
        primaryKey: true,
        references: {
          model: 'users',
          key: 'user_id'
        }
      },
      food_id: {
        type: Sequelize.INTEGER,
        // allowNull: false,
        primaryKey: true,
        references: {
          model: 'foods',
          key: 'food_id'
        }
      },
      amount: {
        type: Sequelize.INTEGER
      },
      code: {
        type: Sequelize.STRING
      },
      arr_sub_id: {
        type: Sequelize.STRING
      },
      createdAt: {
        allowNull: true,
        type: Sequelize.DATE,
        defaultValue: Sequelize.fn('NOW')
      },
      updatedAt: {
        allowNull: true,
        type: Sequelize.DATE,
        defaultValue: Sequelize.fn('NOW')
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('orders');
  }
};