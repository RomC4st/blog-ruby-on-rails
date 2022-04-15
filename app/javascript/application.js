// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "trix"
import "@rails/actiontext"
import "@hotwired/turbo-rails"

import LocalTime from "./i18n/localTimeFR"

LocalTime.start()