const express = require('express');
const studentController = require('../controllers/student.controller');
const router = express.Router();

// ✅ Corrected Routes
router.post('/register', studentController.registerStudent); // Register
router.post('/students/login', studentController.loginStudent); // Login
router.get('/students/:email', studentController.getStudentByEmail); // Fetch Profile
router.put('/students/:email', studentController.updateStudentProfile);

module.exports = router;
