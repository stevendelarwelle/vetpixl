Rails.application.routes.draw do
  devise_for :users
  #get 'tags/:tag', to: 'pins#index', as: :tag
  resources :pins do
    member do
      put "like", to: "pins#upvote"
      #get 'tags/:tag', to: 'pins#index', as: :tag
    end
  end
  root "pins#index"
end
