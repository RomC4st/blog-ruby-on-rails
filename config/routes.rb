Rails.application.routes.draw do
 root :to => redirect('/article')
 resources :article 
end
