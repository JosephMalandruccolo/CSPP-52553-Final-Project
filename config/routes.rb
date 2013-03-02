CollegeLens::Application.routes.draw do
  resources :colleges


  resources :users

  match '/signup', to: 'users#new'



 
end
