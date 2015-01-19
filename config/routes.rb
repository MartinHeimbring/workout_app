Rails.application.routes.draw do

  devise_for :users
  resources :workouts do
    resources :workout_exercises
  end
  resources :exercises

  root 'workouts#index'

end
