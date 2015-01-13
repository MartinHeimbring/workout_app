class CreateWorkoutExercises < ActiveRecord::Migration
  def change
    create_table :workout_exercises do |t|
      t.integer :sets
      t.integer :reps
      t.belongs_to :workout, index: true
      t.references :exercise, index: true

      t.timestamps
    end
  end
end
