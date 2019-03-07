module Admin
  class UsersController < Admin::BaseController
    def show
      @user   = User.find(params[:id])
      @orders = @user.orders

      @orders = case params[:filter]
      when 'paid'     then @orders.paid.order(created_at: :desc).page(params[:page]).per(15)
      when 'not-paid' then @orders.not_paid.order(created_at: :desc).page(params[:page]).per(15)
      else
        @orders.order(created_at: :desc).page(params[:page]).per(15)
      end

      @orders_by_week = @orders.group_by do |order|
        order.created_at.beginning_of_week
      end
    end
  end
end
