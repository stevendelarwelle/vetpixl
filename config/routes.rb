Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" , registrations: 'registrations'}
  
  get 'tags/:tag', to: 'pins#index', as: :tag
  resources :pins do
    member do
      put "like", to: "pins#upvote"
     end
  end
 
  root "pins#index"
end
