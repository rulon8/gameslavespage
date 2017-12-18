Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'main#main'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get '/game/:name' => 'games#show', as: 'game'
  patch '/game/:id' => 'games#update'
  resources :games, except: :show
  resources :posts, except: :index
  resources :pictures
  get '/usuario' => 'main#usuario', as: 'usuario'
  post '/usuario' => 'main#guardar_usuario', as: 'guardar_usuario'
  get '/blog' => 'posts#index', as: 'blog'
  get '/about' => 'main#about', as: 'about'
  get '/in-development' => 'main#in_development', as: 'in_development'
  post '/contact' => 'contact#enviar', as: 'send'
  get '/contact' => 'contact#contact', as: 'contact'
  get '*any' => 'main#not_found', as: 'not_found'
end
