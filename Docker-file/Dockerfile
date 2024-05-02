# Use the official Nginx image as the base image
FROM nginx:latest

# Copy the Nginx configuration file into the container
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the index.html file into the default Nginx html directory
COPY ./html/index.html /usr/share/nginx/html/index.html

# Expose port 8080 to the outside world
EXPOSE 8080

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
