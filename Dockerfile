# Use a base image with Ruby and Node.js
FROM ruby:2.7.4

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install Jekyll and other dependencies
RUN gem install bundler && bundle install

# Copy the entire Jekyll app into the container
COPY . .

# Expose the default Jekyll port
EXPOSE 80

# Build the Jekyll site and serve it
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "80"]
