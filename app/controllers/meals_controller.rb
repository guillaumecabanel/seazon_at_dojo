class MealsController < ApplicationController
  before_action :set_meal, only: [:edit, :update, :destroy]

  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      flash[:notice] = helpers.t("activerecord.models.new_meal_success")
      redirect_to meals_path
    else
      flash.now[:alert] = helpers.t("activerecord.models.new_meal_errors")
      render :new
    end
  end

  def edit

  end

  def update
    if @meal.update(meal_params)
      flash[:notice] = helpers.t("activerecord.models.edit_meal_success")
      redirect_to meals_path
    else
      flash.now[:alert] = helpers.t("activerecord.models.edit_meal_errors")
      render :edit
    end
  end

  def destroy
    @meal.destroy
    flash[:notice] = helpers.t("activerecord.models.meal_destroyed")
    redirect_to meals_path
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:title, :photo)
  end
end
