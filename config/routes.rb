Rails.application.routes.draw do
   resources :sessions , only: [:create,:show]
   get '/profile', to: 'sessions#getuser'
  resources :users
    resources :plates , only: [:index,:show]
     resources :violation , only: [:index,:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
