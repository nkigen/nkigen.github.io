# Use an official Nginx image as a base
FROM nginx:alpine

# Copy the static HTML file to the Nginx document root
COPY index.html /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]