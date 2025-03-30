const db = require('../config/db.config');
const bcrypt = require('bcrypt');

// ✅ Register Student
exports.registerStudent = async (studentData) => {
  const { fullName, dob, gender, contact, email, password, stream } = studentData;

  try {
    // Check if email already exists
    const [existingStudent] = await db.execute('SELECT * FROM students WHERE email = ?', [email]);

    if (existingStudent.length > 0) {
      throw new Error('Email already registered');
    }

    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert student if not existing
    await db.execute(
      'INSERT INTO students (fullName, dob, gender, contact, email, password, stream) VALUES (?, ?, ?, ?, ?, ?, ?)',
      [fullName, dob, gender, contact, email, hashedPassword, stream]
    );
    console.log("✅ Student Registered Successfully");
  } catch (error) {
    console.error("❌ Registration Error:", error.message);
    throw error;
  }
};

// ✅ Login Student
exports.loginStudent = async (email, password) => {
  try {
    const [student] = await db.execute('SELECT * FROM students WHERE email = ?', [email]);

    if (student.length === 0) {
      throw new Error('Email not registered');
    }

    // Compare passwords
    const isMatch = await bcrypt.compare(password, student[0].password);

    if (!isMatch) {
      throw new Error('Invalid Password');
    }

    console.log("✅ Login Successful");
    return student[0];
  } catch (error) {
    console.error("❌ Login Error:", error.message);
    throw error;
  }
};
