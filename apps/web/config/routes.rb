root           to: 'dashboard#index'

get '/users/new', to: 'users#new'
post '/users', to: 'users#create'

get '/sign_in', to: 'sessions#new'
post '/sessions', to: 'sessions#create'
