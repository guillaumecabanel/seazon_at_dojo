module Admin
  class StatisticsController < Admin::BaseController
    def show
      @begin_date   = params[:begin_date] &&  !params[:begin_date].empty? ? Date.parse(params[:begin_date]) : Date.today - 14.days
      @end_date     = params[:end_date]   &&  !params[:end_date].empty?   ? Date.parse(params[:end_date])   : Date.today
      @orders       = Order.where(created_at: @begin_date.beginning_of_day..@end_date.end_of_day)
      @orders_count = @orders.count

      set_orders_by_day_data
      paid_orders = @orders.where.not(paid_at: nil).count
      unpaid_orders = @orders.where(paid_at: nil).count

      @orders_payments_data = {
        labels: ["Payées", "Non payées"],
        datasets: [{
          values: [paid_orders, unpaid_orders]
        }]
      }.to_json

    end



    private

    def set_orders_by_day_data
      last_days_array = (@begin_date..@end_date).map do |day|
        helpers.l(day, format: "%a %d")
      end

      orders_count_by_day_array = (@begin_date..@end_date).map do |day|
        Order.where(created_at: day.beginning_of_day..day.end_of_day).count
      end

      @orders_by_day_data = {
        labels: last_days_array,
        datasets: [{
          names: "Commandes",
          values:orders_count_by_day_array
        }]
      }.to_json
    end
  end
end
