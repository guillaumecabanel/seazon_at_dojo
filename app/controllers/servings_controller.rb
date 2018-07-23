class ServingsController < ApplicationController
  before_action :set_serving, only: [:edit, :update, :destroy]
  before_action :set_meals,   only: [:new, :edit, :update]

  def index
    @servings = Serving.all
  end

  def new
    @serving = Serving.new
  end

  def create
    @serving = Serving.new(serving_params)

    if @serving.save
      flash[:notice] = helpers.t("activerecord.models.new_serving_success")
      redirect_to servings_path
    else
      flash.now[:alert] = helpers.t("activerecord.models.new_serving_errors")
      render :new
    end
  end

  def edit
  end

  def update
    if @serving.update(serving_params)
      flash[:notice] = helpers.t("activerecord.models.edit_serving_success")
      redirect_to servings_path
    else
      flash.now[:alert] = helpers.t("activerecord.models.edit_serving_errors")
      render :edit
    end
  end

  def destroy
    if @serving.orders.any?
      flash[:alert] = "Il n'est pas possible de supprimer un repas ayant déjà des commandes"
      redirect_to servings_path
    else
      @serving.destroy
      flash[:notice] = helpers.t("activerecord.models.serving_destroyed")
      redirect_to servings_path
    end
  end

  private

  def set_serving
    @serving = Serving.find(params[:id])
  end

  def set_meals
    @meals = Meal.all
  end

  def serving_params
    params.require(:serving).permit(
      :price,
      :quantity,
      :best_before,
      :meal_id
    )
  end
end
