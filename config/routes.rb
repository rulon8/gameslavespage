Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :games
  root to: 'main#main'
  authenticate :user do
    mount Blazer::Engine, at: "blazer"
  end
  patch '/game/:id' => 'games#update', except: :show
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
