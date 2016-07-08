Rails.application.routes.draw do
  resources :mirrors
  root 'mirrors#index'
end
