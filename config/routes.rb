Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'home/index'
  get 'welcome/index'

  
resources :articles do
  resources :comments
end
  # get 'articles/new'

  resources :comments do
    resources :comments
  end

  root to: "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
