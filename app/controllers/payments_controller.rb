class PaymentsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @order.update(paid_at: Time.now)
    redirect_to orders_path
  end

  def destroy
    @order = Order.find(params[:order_id])
    @order.update(paid_at: nil)
    redirect_to orders_path
  end
end
