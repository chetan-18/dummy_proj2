Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "about", to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'  # need to create user contriller and action new in it
  # get 'users', to: 'users#create' # users will have all restful routes as well for that resources is used
  resources :users, except: [:new]  # except means we get all routes excluding new

end
