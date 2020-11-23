Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  get 'home/index'
  get 'welcome/index'

  
  resources :articles,  only: [:create, :new, :index, :destroy] do
    resources :comments
  end
  # get 'articles/new'

  resources :comments do
    resources :comments
  end

  get '/articles/:slug' => 'articles#show'
  get '/articles/:slug/edit' => 'articles#edit', as: 'edit_article'
  patch '/articles/:slug' => 'articles#update'

  root to: "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
