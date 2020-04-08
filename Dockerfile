FROM ruby:2.7.1

RUN apt-get update -qq

# install mecab
RUN apt-get install -yq libmecab2 libmecab-dev mecab mecab-ipadic mecab-ipadic-utf8 mecab-utils


ENV APP_ROOT /app
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

ENV LANG=C.UTF-8
RUN bundle config path /usr/local/bundle