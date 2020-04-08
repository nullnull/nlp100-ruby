FROM ruby:2.7.1

RUN bundle config path /usr/local/bundle

ENV APP_ROOT /app
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

ENV LANG=C.UTF-8