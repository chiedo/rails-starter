FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  nodejs-legacy \
  npm

# Set up the App
RUN mkdir /code
ADD Gemfile /code/Gemfile
ADD Gemfile.lock /code/Gemfile.lock
ADD react/package.json /code/react/package.json
WORKDIR /code/react
RUN npm install && npm install -g gulp
WORKDIR /code
RUN bundle install
