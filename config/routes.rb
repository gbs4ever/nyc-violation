Rails.application.routes.draw do
   root   to: 'sessions#welcome' 
   resources :sessions , only: [:create,:show]
    get '/profile', to: 'sessions#getuser'
    post'/buildings', to: 'violations#buildings'
     
    post '/violations', to: 'violations#search'
    delete '/logout', to: 'sessions#destroy'
  
    resources :users , only: [:create,:show]
    resources :plates , only: [:index,:show]
     resources :violation , only: [:index,:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
