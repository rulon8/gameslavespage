Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :games
  root to: 'main#main'
  resources :posts, except: :index
  get '/blog' => 'posts#index'
  get '/about' => 'main#about', as: 'about'
  get '/in-development' => 'main#in_development', as: 'in_development'
  get '/users/creaTemp' => 'users#creaTemp'
end
