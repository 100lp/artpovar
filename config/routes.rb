Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    
    root 'pages#index'
    # обратная связь
    get '/messages' => 'messages#new', :as => 'messages'
    post '/messages' => 'messages#create'
    
    # navigation
    get '/about', to: 'pages#about'
    get '/news', to: 'pages#news'
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

    resources :categories, only: [], path: ''  do
      resources :articles, only: :show, path: ''
    end
  end 
end
