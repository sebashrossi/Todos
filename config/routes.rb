Rails.application.routes.draw do
  resources :users do
    resources :todos, only: [:new, :create, :edit, :update, :destroy]
  end
  root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
