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

  get '/dishes', to: 'dishes#index'
  get '/dishes/:id', to: 'dishes#show'
  get '/dishes/:id/edit', to: 'dishes#edit'
  patch '/dishes/:id', to: 'dishes#update'
  
  get '/restaurants/:id/dishes', to: 'restaurant_dishes#index'
  get '/restaurants/:id/dishes/new', to: 'restaurant_dishes#new'
  post '/restaurants/:id/dishes', to: 'restaurant_dishes#create'
end
