Rails.application.routes.draw do
  devise_for :users

  root'post_images#index'

  resources :post_images, only: [:new, :create, :index, :show] do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
  end

# get 画面変わります
# post データ送信します
end
