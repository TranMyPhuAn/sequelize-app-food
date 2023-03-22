'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('foods', {
      food_id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      food_name: {
        type: Sequelize.STRING
      },
      image: {
        type: Sequelize.STRING,
        defaultValue: 'https://picsum.photos/1000'
      },
      price: {
        type: Sequelize.FLOAT
      },
      des_cription: {
        type: Sequelize.STRING
      },
      type_id: {
        type: Sequelize.INTEGER,
        references: {
          model: 'food_type',
          key: 'type_id'
        }
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
    await queryInterface.dropTable('foods');
  }
};