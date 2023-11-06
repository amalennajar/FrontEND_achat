# Use an official Nginx runtime as a parent image
FROM nginx:latest

# Set the working directory to the Nginx web root
WORKDIR /usr/share/nginx/html

# Copy the pre-built contents of your Angular app to the working directory in the container
COPY dist/ .

# Expose the port on which Nginx will run (port 80 is the default for HTTP)
EXPOSE 82

# Start the Nginx server in the foreground
CMD ["nginx", "-g", "daemon off;"]
