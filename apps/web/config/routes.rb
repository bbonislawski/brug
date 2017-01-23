get '/users/new', to: 'users#new'
root           to: 'dashboard#index'
post '/users', to: 'users#create'
