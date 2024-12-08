# frozen_string_literal: true

# == Route Map
#
#                          Prefix Verb   URI Pattern                                                                                       Controller#Action
#                            root GET    /                                                                                                 sessions#welcome
#                        sessions POST   /sessions(.:format)                                                                               sessions#create
#                         session GET    /sessions/:id(.:format)                                                                           sessions#show
#                         profile GET    /profile(.:format)                                                                                sessions#getuser
#                       buildings POST   /buildings(.:format)                                                                              violations#buildings
#                      violations POST   /violations(.:format)                                                                             violations#search
#                          logout DELETE /logout(.:format)                                                                                 sessions#destroy
#                           users POST   /users(.:format)                                                                                  users#create
#                            user GET    /users/:id(.:format)                                                                              users#show
#                          plates GET    /plates(.:format)                                                                                 plates#index
#                           plate GET    /plates/:id(.:format)                                                                             plates#show
#                 violation_index GET    /violation(.:format)                                                                              violation#index
#                       violation GET    /violation/:id(.:format)                                                                          violation#show
#              rails_service_blob GET    /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
#        rails_service_blob_proxy GET    /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
#                                 GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
#       rails_blob_representation GET    /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
# rails_blob_representation_proxy GET    /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
#                                 GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
#              rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
#       update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                               active_storage/disk#update
#            rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                    active_storage/direct_uploads#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'sessions#welcome'
  resources :sessions, only: %i[create show]
  get '/profile', to: 'sessions#getuser'
  post '/buildings', to: 'violations#buildings'

  post '/violations', to: 'violations#search'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: %i[create show]
  resources :plates, only: %i[index show]
  resources :violation, only: %i[index show]
end
