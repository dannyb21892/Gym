Rails.application.routes.draw do
  get "/", to: "application#home", as: "root"
  get "/users/:id/downgrade_plan", to: "users#downgrade_plan", as: "downgrade"
  patch "/users/:id/downgrade_plan", to: "users#downgrade_plan"
  get "/users/:id/delete", to: "users#delete", as: "delete_user"
  get "/users/:id/goodbye", to: "users#goodbye", as: "goodbye"
  resources :trainers
  resources :lessons
  resources :class_plans
  resources :plans
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
