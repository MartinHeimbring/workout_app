class Workout < ActiveRecord::Base
  has_many :workout_exercises, dependent: :destroy
end
