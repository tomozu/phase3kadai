Rails.application.routes.draw do
  root to: 'tops#index'
  resources :topics do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :favorites, only: [:create, :destroy, :show]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end