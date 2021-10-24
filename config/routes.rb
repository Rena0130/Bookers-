Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  
  resources :users, only: [:index, :show, :edit, :update] do
    get :following
    get :followed
  end
  
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
   get 'relationships/create'
   get 'relationships/destroy'
   post 'follow/:id' => 'relationships#follow', as: 'follow'
   post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
   get '/search' => 'search#search'
end
