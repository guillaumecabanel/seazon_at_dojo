class OrdersController < ApplicationController
  def index
    @orders = Order.where(user: current_user).order(created_at: :desc).page(params[:page]).per(15)

    @orders_by_week = @orders.group_by do |order| 
      order.created_at.beginning_of_week
    end
  end

  def new
    @serving = Serving.find(params[:serving_id])
    @order   = Order.new(pro_expense: current_user.pro_expenses)
  end

  def create
    @order         = Order.new(order_params)
    @order.serving = Serving.find(params[:serving_id])
    @order.user    = current_user

    if @order.save
      flash[:notice] = helpers.t("activerecord.models.new_order_success")
      redirect_to servings_path
    else
      flash.now[:alert] = helpers.t("activerecord.models.new_order_errors")
      render :new
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(pro_expense: params[:pro_expense]) unless @order.paid_at
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:pro_expense)
  end
end
