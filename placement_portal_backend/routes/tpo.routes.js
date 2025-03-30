// backend/routes/tpo.js
const express = require('express');
const router = express.Router();
const { loginTPO } = require('../controllers/tpoController');

// Login Route
router.post('/login', loginTPO);

module.exports = router;