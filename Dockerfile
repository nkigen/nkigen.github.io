# Use an official Jekyll image as the base image
FROM jekyll/jekyll:latest

# Set the working directory to the Jekyll project root
WORKDIR /srv/jekyll

# Copy the entire project to the working directory
COPY . .

# Install Jekyll and other dependencies
RUN bundle install

# Build the Jekyll site
RUN jekyll build

# Expose port 80
EXPOSE 80

# Command to run the Jekyll site on port 80
CMD ["jekyll", "serve", "--host", "0.0.0.0", "--port", "80"]
