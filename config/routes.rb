Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "about", to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'  # need to create user contriller and action new in it
  # post 'users', to: 'users#create' # users will have all restful routes as well, for that resources is used
  resources :users, except: [:new]  # we get all routes except new

  get 'login', to: 'sessions#new'  # won't use resources because login does not hit database 
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
