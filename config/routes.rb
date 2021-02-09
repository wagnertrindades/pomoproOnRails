Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :path => "accounts"

  resources :users, only: [] do
    resources :timers, only: [:create, :index]
  end

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end

end
