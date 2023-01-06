#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
npm install
bundle exec rake dartsass:build
bundle exec rake assets:precompile
bundle exec rake assets:clean
# Production configuration
# bundle exec rake db:migrate
# bundle exec rake db:seed

# Temp configuration until database config and seeding sorted
bundle exec rake db:reset
