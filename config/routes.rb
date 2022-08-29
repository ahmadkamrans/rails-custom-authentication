Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index"

  scope :users do
    get "sign_up", to: "users/registrations#new"
    post "sign_up", to: "users/registrations#create"

    get "login", to: "users/sessions#new"
    post "login", to: "users/sessions#create"

    delete "logout", to: "users/sessions#destroy"

    resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token, module: 'users'
  end
end
