Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :games, only: [:index, :show]
      resources :category_leaderboards, only: [:index, :show]
      resources :users, only: [:index, :show, :new, :create]
      resources :runs, only: [:index, :show]
      resources :runners, only: [:index, :show]
      resources :sessions, except: [:show, :index]
      resources :streams
    end
  end


end
