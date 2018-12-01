Rails.application.routes.draw do
  root to: 'tops#index'
  resources :topics do
    resources :favorites, only: [:create, :destroy]
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do 
    resources :favorites, only: [:index]
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end