class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: :index
  def index
    if current_user
      @workouts = current_user.workouts.all.order("created_at DESC")
      @workout_exercise = current_user.workouts.new
    end
  end

  def show
  end

  def new
    @workout = current_user.workouts.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to @workout
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout
    else
      render 'edit'
    end
  end

  def destroy
    @workout.destroy
    redirect_to root_path
  end

  private

    def workout_params
      params.require(:workout).permit(:date, :workout, :mood, :length)
    end

    def find_workout
      @workout = Workout.find(params[:id])
    end
end
