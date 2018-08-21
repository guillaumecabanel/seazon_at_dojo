class OrdersController < ApplicationController
  def new
    @serving = Serving.find(params[:serving_id])
    @order = Order.new
  end

  def create
    @order = Order.new
    @order.serving = Serving.find(params[:serving_id])
    @order.user = current_user

    if @order.save
      flash[:notice] = helpers.t("activerecord.models.new_order_success")
      redirect_to servings_path
    else
      flash.now[:alert] = helpers.t("activerecord.models.new_order_errors")
      render :new
    end
  end
end
