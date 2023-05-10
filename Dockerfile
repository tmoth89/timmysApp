# Backend and Frontend Dockerfile
# Use an official Node.js runtime as the base image for both stages
FROM node:14 AS backend-build
FROM node:14 AS frontend-build

# Set the working directory for both stages
WORKDIR /app/backend

### Backend Stage ###
# Copy package.json and package-lock.json to the working directory
COPY backend/package*.json ./

# Install the backend project dependencies
RUN npm install

# Copy the rest of the backend code to the working directory
COPY backend ./

### Frontend Stage ###
# Set the working directory for the frontend stage
WORKDIR /app/frontend/myapp

# Copy package.json and package-lock.json to the working directory
COPY frontend/myapp/package*.json ./

# Install the frontend project dependencies
RUN npm install

# Copy the rest of the frontend code to the working directory
COPY frontend/myapp ./

# Build the frontend app
RUN npm run build

### Final Stage ###
# Use a lightweight web server as the base image for serving the static files
FROM nginx:alpine

# Copy the built frontend files to the web server's default directory
COPY --from=frontend-build /app/frontend/myapp/build /usr/share/nginx/html

# Expose port 80 (the default HTTP port)
EXPOSE 80

# Start the web server
CMD ["nginx", "-g", "daemon off;"]
