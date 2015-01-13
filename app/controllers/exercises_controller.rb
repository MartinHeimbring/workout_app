class ExercisesController < ApplicationController
  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.create(exercise_params)
    if @workout.save
      redirect_to workout_path(@workout)
    else
      render 'new'
    end
  end

  private

    def exercise_params
      params.require(:exercise).permit(:name, :sets, :reps)
    end
end
