#!/usr/bin/env bash

bin/rails db:migrate RAILS_ENV=development
rake db:seed
bundle install
bin/rails server