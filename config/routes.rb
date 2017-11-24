Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :games
  get '/' => 'main#main'
  resources :posts, except: :index
  get '/blog' => 'posts#index'
  get '/about' => 'main#about', as: 'about_path'
  get '/users/creaTemp' => 'users#creaTemp'
end
