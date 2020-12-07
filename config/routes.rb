Rails.application.routes.draw do
  root 'welcome#index'# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/networks', to: 'networks#index'
  get '/networks/new', to: 'networks#new'
  post '/networks', to: 'networks#create'
  get '/networks/:id', to: 'networks#show'
  get '/networks/:id/edit', to: 'networks#edit'
  patch '/networks/:id', to: 'networks#update'
  delete '/networks/:id', to: 'networks#destroy'

  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/new', to: 'restaurants#new'
  post '/restaurants', to: 'restaurants#create'
  get '/restaurants/:id', to: 'restaurants#show'
  get '/restaurants/:id/edit', to: 'restaurants#edit'
  patch '/restaurants/:id', to: 'restaurants#update'
  delete '/restaurants/:id', to: 'restaurants#destroy'

  get '/shows', to: 'shows#index' #US 6 
  get '/networks/:id/shows', to: 'network_shows#index' #US 7 
  get 'shows/:id', to: 'shows#show' #US 8 
  get 'networks/:id/shows/new', to: 'network_shows#new'#US 9
  post '/networks/:id/shows', to: 'network_shows#create' #US 9
  get '/shows/:id/edit', to: 'shows#edit' #US 10
  patch 'shows/:id', to: 'shows#update' #US 10
  delete '/shows/:id', to: 'shows#destroy' #US 11
end
