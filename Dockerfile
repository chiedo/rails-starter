FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Install needed Nodejs Runtime
RUN apt-get update -qq && apt-get -y install nodejs

# Set up the App
RUN mkdir /code
WORKDIR /code
ADD Gemfile /code/Gemfile
RUN bundle install

ADD . /code/
