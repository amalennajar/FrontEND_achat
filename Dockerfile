# Stage 1: Build the Angular application
FROM node:14 as build

WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package.json package-lock.json ./

# Install project dependencies, bypassing peer dependency check
RUN npm install 

# Copy the application files
COPY . .

# Build the Angular application
RUN npm run build

# Stage 2: Use a lightweight image for serving the application
FROM nginx:latest

# Copy the built application to the nginx public folder
COPY --from=build /usr/src/app/dist/ /usr/share/nginx/html

# Expose the port on which the application will run (if needed)
EXPOSE 82
