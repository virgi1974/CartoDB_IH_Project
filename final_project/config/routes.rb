Rails.application.routes.draw do

  devise_for :users

  get '/' => 'users#welcome'

  get '/users/:user_id/mymaps' => 'maps#show_my_maps'
  get '/shared' => 'maps#show_shared_maps'
  get '/shared/info' => 'maps#shared_true'
  get '/maps/:map_id' => 'maps#show_selected_map'
  get '/maps/:map_id/info' => 'maps#show_selected_map_info'
  get '/shared/:map_id/comments' => 'maps#comments'
  get '/studycase' => 'maps#studycase'#*********

  
  get '/comments/:map_id' => 'comments#map_comments'
  get '/maps/:map_id/comments' => 'comments#map_comments'
  
  get '/missing' => 'users#missing'

  resources :users, only: [:index, :show] do 
    resources :maps, only: [:index, :new, :create, :edit, :update, :destroy, :show] do
      resources :comments, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    end
  end


# new_user_session GET    /users/sign_in(.:format)                                 devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                                 devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                                devise/sessions#destroy
#            user_password POST   /users/password(.:format)                                devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                            devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                           devise/passwords#edit
#                          PATCH  /users/password(.:format)                                devise/passwords#update
#                          PUT    /users/password(.:format)                                devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                                  devise/registrations#cancel
#        user_registration POST   /users(.:format)                                         devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                                 devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                                    devise/registrations#edit
#                          PATCH  /users(.:format)                                         devise/registrations#update
#                          PUT    /users(.:format)                                         devise/registrations#update
#                          DELETE /users(.:format)                                         devise/registrations#destroy
#                          GET    /                                                        users#welcome
#                          GET    /users/:user_id/mymaps(.:format)                         maps#show_my_maps
#                          GET    /maps/:map_id(.:format)                                  maps#show_selected_map
#                 comments GET    /comments(.:format)                                      comments#show_shared_maps
#                  missing GET    /missing(.:format)                                       users#missing
#        user_map_comments GET    /users/:user_id/maps/:map_id/comments(.:format)          comments#index
#                          POST   /users/:user_id/maps/:map_id/comments(.:format)          comments#create
#     new_user_map_comment GET    /users/:user_id/maps/:map_id/comments/new(.:format)      comments#new
#    edit_user_map_comment GET    /users/:user_id/maps/:map_id/comments/:id/edit(.:format) comments#edit
#         user_map_comment GET    /users/:user_id/maps/:map_id/comments/:id(.:format)      comments#show
#                          PATCH  /users/:user_id/maps/:map_id/comments/:id(.:format)      comments#update
#                          PUT    /users/:user_id/maps/:map_id/comments/:id(.:format)      comments#update
#                          DELETE /users/:user_id/maps/:map_id/comments/:id(.:format)      comments#destroy
#                user_maps GET    /users/:user_id/maps(.:format)                           maps#index
#                          POST   /users/:user_id/maps(.:format)                           maps#create
#             new_user_map GET    /users/:user_id/maps/new(.:format)                       maps#new
#            edit_user_map GET    /users/:user_id/maps/:id/edit(.:format)                  maps#edit
#                 user_map GET    /users/:user_id/maps/:id(.:format)                       maps#show
#                          PATCH  /users/:user_id/maps/:id(.:format)                       maps#update
#                          PUT    /users/:user_id/maps/:id(.:format)                       maps#update
#                          DELETE /users/:user_id/maps/:id(.:format)                       maps#destroy
#                    users GET    /users(.:format)                                         users#index
#                     user GET    /users/:id(.:format)                                     users#show


end
