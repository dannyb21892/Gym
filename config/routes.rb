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

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/auto_login' => 'sessions#create_from_signup'


  # These routes will be for signup. The first renders a form in the browse, the second will
# receive the form and create a user in our database using the data given to us by the user.
  get '/signup' => 'users#new'
  # post '/users' => 'users#create'
end
