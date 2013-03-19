CollegeLens::Application.routes.draw do


  root to: 'users#new'

  get "colleges/photos/show"
  get "colleges/:id/photos/new", controller: "photos", action: "new", as: "new_photo_path"
  post "colleges/:id/photos/create", controller: "photos", action: "create", as: "photos_path"


  resources :colleges do
  	member do # generates URI like /colleges/1/followers
  		get :followers
  	end
  end


  resources :users do
  	member do	# generates URI like /users/1/following
  		get :following
  	end
  end

  

  match '/follow', to: 'statuses#create'
  match '/unfollow', to: 'statuses#destroy'

  
  ##########################################
  # => SESSIONS
  ##########################################
  resources :sessions, :only => [:new, :create, :destroy]

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'


  ##########################################
  # => CITIES ROUTES [ADMIN ONLY]
  ##########################################
  match 'updateCities', to: 'cities#import'
  match 'listCities', to: 'cities#index'
  match 'saveCities', to: 'cities#save'
 
end
