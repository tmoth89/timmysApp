// frontend/src/App.js
import React, { useEffect, useState } from 'react';

const App = () => {
  const [users, setUsers] = useState([]);
  const apiUrl = 'http://timmysapp-backend:5000/api/users';

  useEffect(() => {
    fetch(apiUrl)
      .then((response) => response.json())
      .then((data) => setUsers(data));
  }, []);

  return (
    <div>
      <h1>Users:</h1>
      <ul>
        {users.map((user) => (
          <li key={user.id}>{user.name}</li>
        ))}
      </ul>
    </div>
  );
};

export default App;

