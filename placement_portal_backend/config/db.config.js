const mysql = require('mysql2/promise'); // ✅ Ensure 'mysql2/promise' is used

const db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'Gani@2003',
    database: 'placement'
});

module.exports = db;
