Rails.application.routes.draw do
  get 'pages/about'

  get 'pages/help'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" , registrations: 'registrations'}
  
	
  get 'tags/:tag', to: 'pins#index', as: :tag
  get 'user/:user', to: 'pins#index', as: :user
  resources :pins do
    member do
      put "like", to: "pins#upvote"
      put "down", to: "pins#downvote"
     end
  end
 
  root "pins#index"
end
