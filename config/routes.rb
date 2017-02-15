Rails.application.routes.draw do
  resources :servertags
  resources :containertags
  resources :serverhascontainers
  resources :tags
  resources :servers
  resources :containers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
