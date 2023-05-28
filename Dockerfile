# Use an official Node.js runtime as the base image
FROM node:14 AS build-stage

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the frontend code to the working directory
COPY . ./

# Run the build command
RUN npm run build

# Use a lightweight web server as the base image for serving the static files
FROM nginx:alpine

# Copy the built frontend files to the web server's default directory
COPY --from=build-stage /app/build /usr/share/nginx/html

# Expose port 80 (the default HTTP port)
EXPOSE 80

# Start the web server
CMD ["nginx", "-g", "daemon off;"]
