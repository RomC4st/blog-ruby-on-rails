Rails.application.routes.draw do
 resources :article  do
  post 'create' , on: :collection
  get 'show', on: :member
  patch 'update', on: :member
  delete 'destroy', on: :member
 end
end
