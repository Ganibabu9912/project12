// server.js
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const studentRoutes = require('./routes/studentroutes');
const dotenv = require('dotenv');
const jobRoutes = require('./routes/jobs');
const tpoRoutes = require('./routes/tporoutes');

dotenv.config();



const app = express();
const PORT = process.env.PORT || 8080;
app.use(bodyParser.json());
app.use(cors({
    origin: 'http://localhost:4200',
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    credentials: true
}));
app.use('/api', studentRoutes);
app.use('/api/jobs', jobRoutes);
app.use('/api/tpo', tpoRoutes);
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
