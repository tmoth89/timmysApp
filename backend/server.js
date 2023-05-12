const { createLogger, transports } = require("winston");
const LokiTransport = require("winston-loki");
const express = require('express');
const cors = require('cors');

const app = express();
// Enable CORS
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Headers', '*');
  next();
});

const options = {
  transports: [
    new transports.Console(),
    new LokiTransport({
      host: "http://127.0.0.1:3100"
    })
  ]
};
const logger = createLogger(options);

app.get('/api/users', (req, res) => {
  logger.info('Request received for /api/users'); // Log the request

  // Logic to fetch users from the database
  const users = [
    { id: 1, name: 'John Doe' },
    { id: 2, name: 'Jane Smith' },
  ];
  res.json(users);
});

const port = process.env.PORT || 5000;
app.listen(port, () => {
  console.log(`Backend microservice is running on port ${port}`);
});
