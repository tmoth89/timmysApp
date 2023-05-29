# Use an official Node.js runtime as the base image for the backend
FROM node:14 

# Set the working directory for the backend
WORKDIR /app/backend

# Copy package.json and package-lock.json to the working directory
COPY backend/package*.json ./

# Install backend dependencies
RUN npm install

# Copy the rest of the backend code to the working directory
COPY backend ./

# Expose port 80 (the default HTTP port)
EXPOSE 80

# Start the web server and the backend (replace with your backend start command if necessary)
CMD ["node", "server.js"]
