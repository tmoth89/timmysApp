# Use an official Node.js runtime as the base image
FROM node:14 as build-stage

# Set the working directory in the container
WORKDIR /app/frontend/myapp

# Copy package.json and package-lock.json to the working directory
COPY /myapp/package*.json ./

# Install the project dependencies
RUN npm install

# Copy the rest of the frontend code to the working directory
COPY /myapp ./

# Build the frontend app
RUN npm run build

# Use a lightweight web server as the base image for serving the static files
FROM nginx:alpine

# Copy the built frontend files to the web server's default directory
COPY --from=build-stage /app/frontend/myapp/build /usr/share/nginx/html

# Expose port 80 (the default HTTP port)
EXPOSE 80

# Start the web server
CMD ["nginx", "-g", "daemon off;"]

