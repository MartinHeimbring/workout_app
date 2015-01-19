class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @exercise = current_user.exercises.new
    @exercises = current_user.exercises.all
  end


  def create
    @exercise = current_user.exercises.new(exercise_params)
    if @exercise.save
      redirect_to exercises_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to @exercises
    else
      render 'edit'
    end
  end

  def destroy
    @exercise.destroy
    redirect_to exercises_path
  end

  private

    def exercise_params
      params.require(:exercise).permit(:name)
    end

    def set_exercise
      @exercise = Exercise.find(params[:id])
    end
end
