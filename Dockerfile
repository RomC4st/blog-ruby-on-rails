# syntax=docker/dockerfile:1
FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y nodejs sqlite3 
WORKDIR /blog-ruby
COPY Gemfile /blog-ruby/Gemfile
RUN bundle install
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]