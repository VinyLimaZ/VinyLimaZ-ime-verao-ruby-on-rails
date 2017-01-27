Rails.application.routes.draw do
  resources :directors
  resources :actors
  #get 'movies', to: 'movies#index'
  #get 'movies/:id', to: 'movies#show'
  #get 'movies/new', to: 'movies#new'
  #get 'movies/create'
  resources :movies, only: [:new, :show, :index, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
