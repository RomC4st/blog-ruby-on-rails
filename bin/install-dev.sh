#!/usr/bin/env bash

db:migrate 
rake db:seed
bundle install
bin/rails serve