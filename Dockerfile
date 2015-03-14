FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  nodejs-legacy

# Set up the App
RUN mkdir /code
ADD Gemfile /code/Gemfile
ADD Gemfile.lock /code/Gemfile.lock
WORKDIR /code
RUN bundle install
