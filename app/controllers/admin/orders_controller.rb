module Admin
  class OrdersController < Admin::BaseController
    def index
      @orders = Order.all.order(created_at: :desc)
    end
  end
end
