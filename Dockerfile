FROM ruby:3.2.1

ENV APP_DIR="/app/"
RUN mkdir ${APP_DIR}
WORKDIR ${APP_DIR}

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y libpq-dev jq

COPY Gemfile Gemfile.lock ${APP_DIR}
RUN bundle install

COPY . ${APP_DIR}
