// routes/jobRoutes.js
const express = require('express');
const router = express.Router();
const jobController = require('../controllers/jobController');

// ✅ Define Routes and Map to Controllers
router.post('/post', jobController.postJob);             // POST Job
router.get('/getJobs', jobController.getAllJobs);
router.get('/getJob/:id', jobController.getJobById);     // GET Job by ID
router.post('/apply', jobController.applyJob);
router.get('/applied-students', jobController.getAppliedStudents);
module.exports = router;
