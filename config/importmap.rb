# Pin npm packages by running ./bin/importmap
Rails.application.config.importmap.draw do
  pin "trix"
  pin "@rails/actiontext", to: "actiontext.js" 
  pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
  pin "local-time" # @2.1.0  
  pin "application", preload: true
end
