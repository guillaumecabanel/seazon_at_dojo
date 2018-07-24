module Admin
  class MealsController < Admin::BaseController
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
        redirect_to admin_meals_path
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
        redirect_to admin_meals_path
      else
        flash.now[:alert] = helpers.t("activerecord.models.edit_meal_errors")
        render :edit
      end
    end

    def destroy
      if @meal.servings.any?
        flash[:alert] = "Il n'est pas possible de supprimer un repas qui possède des plats."
        redirect_to admin_meals_path
      else
        @meal.destroy
        flash[:notice] = helpers.t("activerecord.models.meal_destroyed")
        redirect_to admin_meals_path
      end
    end

    private

    def set_meal
      @meal = Meal.find(params[:id])
    end

    def meal_params
      params.require(:meal).permit(:title, :photo, :veggie)
    end
  end
end
