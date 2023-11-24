# Use an official Jekyll image as the base image
FROM jekyll/builder:latest

# Set the working directory to the Jekyll project root
WORKDIR /srv/jekyll

# Copy the entire project to the working directory
COPY . .

# Install Jekyll and other dependencies
RUN bundle install

# Build the Jekyll site
RUN jekyll build

# Set up Nginx to serve the built Jekyll site
FROM nginx:alpine
COPY --from=0 /srv/jekyll/_site /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Command to run Nginx
CMD ["nginx", "-g", "daemon off;"]
