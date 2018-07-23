class OrdersController < ApplicationController
  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def new
    @serving = Serving.find(params[:serving_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user


    if @order.save
      flash[:notice] = helpers.t("activerecord.models.new_order_success")
      redirect_to servings_path
    else
      flash.now[:alert] = helpers.t("activerecord.models.new_order_errors")
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:serving_id)
  end
end
