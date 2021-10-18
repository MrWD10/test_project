Rails.application.routes.draw do
  resources :tasks


  get 'users/index'
  devise_for :users, path: '', path_names: {sign_in: 'login',
    sign_out: 'logout', sign_up: 'register'}
  resources :businesses

  #get 'logout' => :destroy
delete "logout", :to => "devise/sessions#destroy", as: :logout
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :users  do
    collection do
      get :show_business 
    end
    
   end
end
