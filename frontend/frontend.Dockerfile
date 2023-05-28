# Use an official Node.js runtime as the base image
FROM node:latest 

# Set the working directory in the container
WORKDIR /app/frontend/myapp

# Copy package.json and package-lock.json to the working directory
COPY /myapp/package*.json ./

# Install the project dependencies
RUN npm install

# Copy the rest of the frontend code to the working directory
COPY /myapp ./

# Expose port 80 (the default HTTP port)
EXPOSE 80

# Start the web server
CMD ["npm", "start"]

