FROM ruby:2.3-slim

RUN gem install redlock

ADD redlock-test.rb .
