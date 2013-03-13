CollegeLens::Application.routes.draw do


  get "colleges/photos/show"
  get "colleges/:id/photos/new", controller: "photos", action: "new", as: "new_photo_path"



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

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'

  match '/follow', to: 'statuses#create'
  match '/unfollow', to: 'statuses#destroy'

  
  resources :sessions, :only => [:new, :create, :destroy]

 
end
