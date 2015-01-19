Rails.application.routes.draw do


  devise_for :users
  resources :workouts do
    resources :workout_exercises
  end
  resources :exercises
  resources :users, except: [:index,:new,:create]

  root 'workouts#index'

end
