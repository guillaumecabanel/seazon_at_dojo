module Admin
  class OrdersController < Admin::BaseController
    def index
      @orders = Order.order(created_at: :desc).page(params[:page]).per(25)
    end
  end
end
