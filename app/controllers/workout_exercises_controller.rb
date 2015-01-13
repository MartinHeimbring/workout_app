class WorkoutExercisesController < ApplicationController
  before_action :find_workout_exercise, only: [:update, :destroy]
  before_action :find_workout, only: [:new, :create, :destroy]

  def new
    @workout_exercise = @workout.workout_exercises.new
    @exercises = Exercise.all
  end

  def create
    @workout_exercise = @workout.workout_exercises.create(exercise_params)
    if @workout_exercise.save
      redirect_to @workout
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @workout_exercise.destroy
    redirect_to workout_path(@workout)
  end

  private

    def exercise_params
      params.require(:workout_exercise).permit(:sets, :reps, :exercise_id)
    end

    def find_workout_exercise
      @workout_exercise = WorkoutExercise.find(params[:id])
    end

    def find_workout
      @workout = Workout.find(params[:workout_id])
    end
end
