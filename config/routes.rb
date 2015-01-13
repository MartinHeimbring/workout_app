Rails.application.routes.draw do

  resources :workouts do
    resources :workout_exercises
  end
  resources :exercises

  root 'workouts#index'

end
