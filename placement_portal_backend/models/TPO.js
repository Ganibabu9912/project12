const { DataTypes } = require('sequelize');
const sequelize = require('../config/db.config');

const TPO = sequelize.define('TPO', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    username: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true
    },
    password: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    tableName: 'tpo',
    timestamps: false
});

module.exports = TPO;
