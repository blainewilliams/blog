Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users
  resources :posts do
  	collection do
  		get 'search'
  	end
  	resources :comments
  end
  root "posts#index"
  get "/about", to: "pages#about"
  get 'posts/:id/remove_image', to: 'posts#remove_image', as: 'remove_post_image'
end
