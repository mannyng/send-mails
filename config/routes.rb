Rails.application.routes.draw do
  devise_for :users
  resources :massmails do
     
     collection do
       get :mysender
       post :sendengine
       get :myletter
       post :letterengine
     end 
  end 
  root 'massmails#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
