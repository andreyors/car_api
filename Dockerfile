# syntax = docker/dockerfile:experimental
FROM ruby:2.7.1-buster

ENV RAILS_ENV production
ENV RACK_ENV production
ENV GEM_HOME=/app/vendor/bundle/ruby/2.7.1
ENV GEM_PATH=$GEM_HOME:$GEM_PATH
ENV PATH=$GEM_HOME/bin:$PATH
ENV BUNDLE_APP_CONFIG=.bundle

RUN set -xe \
  && mkdir -p /app \
  && apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends postgresql-server-dev-all libpq-dev

WORKDIR /app

COPY Gemfile* /app

RUN --mount=target=/app/tmp/bundle,type=cache \
  bundle config set path '/app/tmp/bundle' \
  && bundle install \
  && cp -r tmp/bundle/ vendor \
  && bundle config --local path vendor/bundle

COPY . /app
