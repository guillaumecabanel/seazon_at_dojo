module Admin
  class PaymentsController < Admin::BaseController
    def create
      @order = Order.find(params[:order_id])
      @order.update(paid_at: Time.now)
      redirect_to admin_orders_path
    end

    def destroy
      @order = Order.find(params[:order_id])
      @order.update(paid_at: nil)
      redirect_to admin_orders_path
    end
  end
end
