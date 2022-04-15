# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "local-time", to: "https://ga.jspm.io/npm:local-time@2.1.0/app/assets/javascripts/local-time.js"
