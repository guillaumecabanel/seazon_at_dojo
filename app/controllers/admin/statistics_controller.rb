module Admin
  class StatisticsController < Admin::BaseController
    def show
      @begin_date   = params[:begin_date].present? ? Date.parse(params[:begin_date]) : Date.today - 14.days
      @end_date     = params[:end_date].present?   ? Date.parse(params[:end_date])   : Date.today

      @orders       = Order.where(created_at: @begin_date.beginning_of_day..@end_date.end_of_day)
      @orders_count = @orders.count

      set_orders_by_day_data
      set_orders_payments_data
    end

    private

    def set_orders_by_day_data
      last_days = (@begin_date..@end_date).map do |day|
        helpers.l(day, format: "%a %d")
      end

      orders_count_by_day_with_missing_days = Order.
        select('date(created_at) AS date, count(*) AS orders_count').
        where(created_at: @begin_date.beginning_of_day..@end_date.end_of_day).
        group("date(created_at)").
        reduce({}) { |acc, order| acc[order.date] = order.orders_count; acc }

      orders_count_by_day = (@begin_date..@end_date).map do |day|
        orders_count_by_day_with_missing_days[day] || 0
      end

      @orders_by_day_data = {
        labels: last_days,
        datasets: [{
          name: "Commandes",
          values: orders_count_by_day
        }]
      }.to_json
    end

    def set_orders_payments_data
      paid_orders   = @orders.paid.count
      unpaid_orders = @orders.not_paid.count

      @orders_payments_data = {
        labels: ["Payées", "Non payées"],
        datasets: [{
          values: [paid_orders, unpaid_orders]
        }]
      }.to_json
    end
  end
end
