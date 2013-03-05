CollegeLens::Application.routes.draw do



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

  

 
end
