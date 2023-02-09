Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  #get '/users/new', to: 'users#new'
  #post '/users', to: 'user#create' #en ves de esto se usa reosurces
  #get 'welcome/index' # esto genera al generar el controlador no lo necesitamos por el momento
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create' 
  get 'logout', to: 'sessions#destroy'
  
  root 'welcome#index'
  resources :users, only: [:new, :create] #usa el nombre del modelo en prural
end
