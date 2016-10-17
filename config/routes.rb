Rails.application.routes.draw do
  root 'admin/pages#home'

  namespace :admin do
    resources :categories
    
    resources :establishments do
        resources :products
        resources :comandas
    end

  end
  #get 'users/sign_in' => 'pages#home'

  
  post 'users' => 'users#create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
