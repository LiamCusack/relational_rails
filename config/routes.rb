Rails.application.routes.draw do
  root 'welcome#index'# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/networks', to: 'networks#index'
  get '/restaurants', to: 'restaurants#index'
  post '/networks', to: 'networks#create'
  get '/networks/:id', to: 'networks#show'
  get '/networks/new', to: 'networks#new'
end
