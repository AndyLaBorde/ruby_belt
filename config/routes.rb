Rails.application.routes.draw do

  root 'users#index' 
  post 'users/create'   => 'users#create',   as: 'create'
  post 'users/login'    => 'users#login',    as: 'login'
  get 'users/edit'      => 'users#edit',     as: 'edit'
  patch 'users/update'  => 'users#update',   as: 'update'
  delete 'users/logout' => 'users#destroy',  as: 'logout'

  resources :songs

  resources :playlists, only: [:create, :show]

end
 