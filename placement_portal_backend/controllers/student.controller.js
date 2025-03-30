const pool = require('../config/db.config');
const bcrypt = require('bcrypt');
// student.controller.js
// student.controller.js


exports.registerStudent = async (req, res) => {
    try {
        const { fullName, dob, gender, contact, email, password, stream } = req.body;

        // ✅ Validate email correctly
        const [existingStudent] = await db.execute("SELECT * FROM students WHERE email = ?", [email]);

        if (existingStudent.length > 0) {
            return res.status(400).json({ message: "Email already registered" });
        }

        // ✅ Insert student data
        await db.execute(
            "INSERT INTO students (fullName, dob, gender, contact, email, password, stream) VALUES (?, ?, ?, ?, ?, ?, ?)",
            [fullName, dob, gender, contact, email, password, stream]
        );

        res.status(201).json({ message: "Student registered successfully" });
    } catch (error) {
        console.error("❌ Registration Error:", error);
        res.status(500).json({ message: "Registration failed", error: error.message });
    }
};

// Login Function
exports.loginStudent = async (req, res) => {
    const { email, password } = req.body;

    try {
        console.log("Received data:", email, password);

        // Execute the query using the pool
        const [result] = await pool.execute(
            "SELECT * FROM students WHERE email = ? AND password = ?",
            [email, password]
        );

        if (result.length > 0) {
            res.status(200).json({ message: "Login Successful", user: result[0] });
        } else {
            res.status(401).json({ message: "Invalid Credentials" });
        }
    } catch (error) {
        console.error("Error during login:", error);
        res.status(500).json({ message: "Error during login", error: error.message });
    }
};
// Fetch Student Profile by Email
exports.getStudentByEmail = (req, res) => {
    const email = req.params.email;
    
    pool.execute("SELECT * FROM students WHERE email = ?", [email])
        .then(([rows]) => {
            if (rows.length > 0) {
                res.status(200).json(rows[0]);
            } else {
                res.status(404).json({ message: "Student not found" });
            }
        })
        .catch(error => {
            console.error("Error fetching student profile:", error);
            res.status(500).json({ message: "Error fetching profile" });
        });
};

// ✅ Update Student Profile
exports.updateStudentProfile = async (req, res) => {
    try {
        const { email } = req.params;
        console.log("📧 Received Email:", email);

        // ✅ Destructure with defaults
        const {
            fullName = null,
            dob = null,
            gender = null,
            contact = null,
            password = null,
            stream = null
        } = req.body;

        // 🔍 Check if student exists
        const [existingStudent] = await pool.execute(
            'SELECT * FROM students WHERE email = ?', [email]
        );

        if (existingStudent.length === 0) {
            console.log("⚠️ Student Not Found");
            return res.status(404).json({ message: 'Student not found' });
        }

        // ✅ Proceed with update
        await pool.execute(
            'UPDATE students SET fullName = ?, dob = ?, gender = ?, contact = ?, password = ?, stream = ? WHERE email = ?',
            [fullName, dob, gender, contact, password, stream, email]
        );

        res.status(200).json({ message: 'Profile updated successfully' });
    } catch (error) {
        console.error("❌ Server Error Details:", error);
        res.status(500).json({ message: "Server Error", error: error.message });
    }
};
