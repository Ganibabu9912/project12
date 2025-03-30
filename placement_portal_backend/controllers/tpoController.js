// backend/controllers/tpoController.js
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const db = require('../config/db.config');
// backend/controllers/tpoController.js

// Define constant username and password
const CONSTANT_USERNAME = "tpoAdmin";
const CONSTANT_PASSWORD = "tpo123"; // Use a strong password in production

// Login TPO Function
exports.loginTPO = async (req, res) => {
    const { username, password } = req.body;

    if (!username || !password) {
        return res.status(400).json({ message: 'Please fill in all fields' });
    }

    try {
        // Compare input with constant values
        if (username !== CONSTANT_USERNAME || password !== CONSTANT_PASSWORD) {
            return res.status(401).json({ message: 'Invalid Credentials' });
        }

        // Generate JWT Token
        const token = jwt.sign({ username: CONSTANT_USERNAME }, 'secretkey', { expiresIn: '1h' });

        res.json({
            message: 'Login successful',
            token
        });

    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Server error' });
    }
};
