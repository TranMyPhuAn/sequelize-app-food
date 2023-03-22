'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('rate_res', {
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
      amount: {
        type: Sequelize.INTEGER
      },
      date_rate: {
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
    // await queryInterface.addConstraint('rate_res', {
    //   fields: ['user_id', 'res_id'],
    //   type: 'primary key',
    //   name: 'rate_res_pk'
    // });
  },
  async down(queryInterface, Sequelize) {
    // await queryInterface.removeConstraint('rate_res', 'rate_res_pk');
    await queryInterface.dropTable('rate_res');
  }
};