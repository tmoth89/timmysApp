# Use an official Node.js runtime as the base image
FROM node:latest

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY /package*.json ./

# Install the project dependencies
RUN npm install

# Copy the rest of the backend code to the working directory
COPY . .

# Expose the port on which your Node.js application will run (change if necessary)
EXPOSE 5000

# Start the Node.js application
CMD ["node", "server.js"]