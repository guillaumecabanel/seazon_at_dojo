module Admin
  class OrdersController < Admin::BaseController
    def index
      @orders = case params[:filter]
      when 'paid' then Order.paid.order(created_at: :desc).page(params[:page]).per(15)
      when 'not-paid' then Order.not_paid.order(created_at: :desc).page(params[:page]).per(15)
      else
        Order.order(created_at: :desc).page(params[:page]).per(15)
      end

      @orders_by_week = @orders.group_by { |order| order.created_at.beginning_of_week }
    end
  end
end
