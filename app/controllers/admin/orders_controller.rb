module Admin
  class OrdersController < Admin::BaseController
    def index
      @orders = case params[:filter]
      when 'paid' then Order.paid.order(created_at: :desc).page(params[:page]).per(15)
      when 'not-paid' then Order.not_paid.order(created_at: :desc).page(params[:page]).per(15)
      else
        Order.order(created_at: :desc).page(params[:page]).per(15)
      end
    end
  end
end
