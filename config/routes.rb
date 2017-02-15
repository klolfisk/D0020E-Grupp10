Rails.application.routes.draw do

  devise_for :users
	resources :containers
	root 'home#index'
	resources :servers
	get '/containers/:id/start', to: 'containers#start', as: 'start_container'
	get '/containers/:id/stop', to: 'containers#stop', as: 'stop_container'
	get '/containers/:id/pause', to: 'containers#pause'
	get '/containers/:id/unpause', to: 'containers#unpause'
	get '/containers/new/:id', to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
