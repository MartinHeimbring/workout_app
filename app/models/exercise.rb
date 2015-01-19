class Exercise < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises, dependent: :destroy
end
