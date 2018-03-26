Rails.application.routes.draw do
  get "/", to: "application#home", as: "root_path"
  resources :trainers
  resources :lessons
  resources :class_plans
  resources :plans
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
