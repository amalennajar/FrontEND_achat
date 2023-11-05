# Use a base image with Node.js and NPM installed
FROM node:latest as build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package.json package-lock.json /app/

# Install project dependencies
RUN npm install

# Copy the entire project directory to the container
COPY . /app

# Build the Angular application (replace 'ng build' with your actual build command)
RUN npm run build

# Use a lightweight image for serving the application
FROM nginx:latest

# Copy the built application to the nginx public folder
COPY --from=build /app/dist/ /usr/share/nginx/html

# Expose the port on which the application will run (if needed)
EXPOSE 82

# The default command to start the nginx server (not usually needed in the Dockerfile)
# CMD ["nginx", "-g", "daemon off;"]
