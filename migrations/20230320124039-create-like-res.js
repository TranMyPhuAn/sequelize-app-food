'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('like_res', {
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
      res_id: {
        type: Sequelize.INTEGER,
        // allowNull: false,
        primaryKey: true,
        references: {
          model: 'restaurants',
          key: 'res_id'
        },
      },
      date_like: {
        type: Sequelize.DATE,
        defaultValue: Sequelize.fn('NOW')
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE,
        defaultValue: Sequelize.fn('NOW')
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE,
        defaultValue: Sequelize.fn('NOW')
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('like_res');
  }
};