FROM ruby:2.7

WORKDIR /app

COPY . /app

RUN bundle install