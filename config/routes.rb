Rails.application.routes.draw do
  root 'users#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy, :index]
  resources :contacts
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
