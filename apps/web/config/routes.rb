root           to: 'dashboard#index'

get '/users/new', to: 'users#new'
post '/users', to: 'users#create'

get '/sessions/new', to: 'sessions#new'
