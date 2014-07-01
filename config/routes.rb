Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :categories, only: :show do
    resources :articles, only: :show, path: ''
  end

  root 'pages#index'
  # обратная связь
  # get 'contact' => 'contact#new', :as => 'contact'
  # post 'contact' => 'contact#create'
  
  # navigation
  get '/about', to: 'pages#about'
  get '/pressa', to: 'pages#pressa'
  get '/classes', to: 'pages#classes'
  get '/doings', to: 'pages#doings'
  get '/contacts', to: 'pages#contacts'

  # left navigation
  get '/new', to: 'pages#new'
  get '/ugolki-dushi', to: 'pages#ugolki'
  get '/sozvezdii-slona', to: 'pages#sozvezdie'
  get '/lady', to: 'pages#lady'
  get '/homo-insectarium', to: 'pages#homo'

  

  # # try to render
  # get '(*page)' => 'articles#show' 
end
