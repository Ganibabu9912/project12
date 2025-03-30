// controllers/jobController.js
const mysql = require('mysql2');

// ✅ MySQL Database Connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Gani@2003', // Replace with your MySQL password
    database: 'placement'
});

db.connect(err => {
    if (err) {
        console.error("❌ MySQL Connection Failed:", err);
    } else {
        console.log("✅ Connected to MySQL Database");
    }
});

// ✅ POST Job Controller
exports.postJob = (req, res) => {
    const { jobTitle, companyName, jobDescription, jobLocation, salary, eligibility, deadline } = req.body;

    if (!jobTitle || !companyName || !jobDescription || !jobLocation) {
        return res.status(400).json({ message: "⚠️ Required fields are missing" });
    }

    const sql = `
        INSERT INTO jobs (jobTitle, companyName, jobDescription, jobLocation, salary, eligibility, deadline) 
        VALUES (?, ?, ?, ?, ?, ?, ?)
    `;

    db.query(sql, [jobTitle, companyName, jobDescription, jobLocation, salary, eligibility, deadline], (err, result) => {
        if (err) {
            console.error("❌ Error Inserting Job:", err);
            return res.status(500).json({ message: "❌ Error Posting Job" });
        }
        res.status(201).json({ message: "✅ Job Posted Successfully" });
    });
};

// ✅ GET All Jobs Controller
exports.getAllJobs = (req, res) => {
    const sql = "SELECT * FROM jobs ORDER BY deadline ASC";

    db.query(sql, (err, results) => {
        if (err) {
            console.error("❌ Error Fetching Jobs:", err);
            return res.status(500).json({ message: "❌ Server Error" });
        }

        if (results.length === 0) {
            return res.status(404).json({ message: "⚠️ No Jobs Available" });
        }

        res.status(200).json(results);
    });
};

// ✅ GET Job by ID Controller
exports.getJobById = (req, res) => {
    const jobId = req.params.id;

    const sql = "SELECT * FROM jobs WHERE id = ?";
    db.query(sql, [jobId], (err, result) => {
        if (err) {
            console.error("❌ Error Fetching Job:", err);
            return res.status(500).json({ message: "❌ Server Error" });
        }

        if (result.length === 0) {
            return res.status(404).json({ message: "⚠️ Job Not Found" });
        }

        res.status(200).json(result[0]);
    });
};

// ✅ Apply for a Job Controller
// ✅ Corrected Logic
exports.applyJob = (req, res) => {
    console.log("📥 Received Payload in Backend:", req.body); // Check payload

    const { jobId, email } = req.body;

    // Check if payload values are present
    if (!jobId || !email) {
        console.log("⚠️ Missing Fields:", { jobId, email });
        return res.status(400).json({ message: "⚠️ Required fields are missing" });
    }

    // Fetch Student ID
    db.query("SELECT id FROM students WHERE email = ?", [email], (err, results) => {
        if (err || results.length === 0) {
            return res.status(400).json({ message: "⚠️ Student Not Found" });
        }
    

        const studentId = results[0].id;

        // Insert Job Application
        db.query(
            "INSERT INTO job_applications (jobId, studentId) VALUES (?, ?)",
            [jobId, studentId],
            (err, result) => {
                if (err) {
                    console.error("❌ Error Inserting Application:", err);
                    return res.status(500).json({ message: "❌ Failed to Apply for Job" });
                }
                res.status(201).json({ message: "✅ Applied Successfully" });
            }
        );
    });
};

exports.getAppliedStudents = (req, res) => {
    const sql = `
        SELECT 
            students.id AS studentId, 
            students.fullName, 
            students.email, 
            students.contact,
            students.stream,
            jobs.jobTitle, 
            jobs.companyName, 
            jobs.jobLocation,
            jobs.salary
        FROM job_applications
        JOIN students ON job_applications.studentId = students.id
        JOIN jobs ON job_applications.jobId = jobs.id;
    `;

    db.query(sql, (err, results) => {
        if (err) {
            console.error("❌ Error Fetching Applied Students:", err);
            return res.status(500).json({ message: "Server Error" });
        }
        res.status(200).json(results);
    });
};
