Rails.application.routes.draw do

  devise_for :users, :path => "accounts" 

  scope path: :users, as: "user" do
    resources :timers, only: [:create, :index]
  end

  devise_scope :user do
    root :to => 'devise/sessions#new'
  end

end
