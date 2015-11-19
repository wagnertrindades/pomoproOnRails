Rails.application.routes.draw do

  devise_for :users
  resources :timers

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end

end
