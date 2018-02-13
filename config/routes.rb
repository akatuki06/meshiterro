Rails.application.routes.draw do
  # get 'users/show'

  devise_for :users

  root'post_images#index'

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]

# get 画面変わります
# post データ送信します
end
