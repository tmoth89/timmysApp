const express = require('express');
const cors = require('cors'); 
const app = express();

app.use(cors());

app.get('/api/users', (req, res) => {
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