class ServingsController < ApplicationController
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

  def serving_params
    params.require(:serving).permit(
      :price,
      :quantity,
      :best_before
    )
  end
end
