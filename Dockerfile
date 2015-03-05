FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs

# Set up the App
RUN mkdir /code
ADD Gemfile /code/Gemfile
RUN cd /code && bundle install

# This should be the last thing
WORKDIR /code
