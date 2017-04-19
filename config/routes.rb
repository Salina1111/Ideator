Rails.application.routes.draw do
  
  root 'ideas#index'
  resources :salina
end
