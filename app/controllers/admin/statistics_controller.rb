module Admin
  class StatisticsController < Admin::BaseController
    def show
      @begin_date = params[:begin_date] ? Date.parse(params[:begin_date]) : Date.today - 14.days
      @end_date   = params[:end_date]   ? Date.parse(params[:end_date])   : Date.today
      @orders_count = Order.where(created_at: @begin_date.beginning_of_day..@end_date.end_of_day).count

      last_days_array = (@begin_date..@end_date).map do |day|
        helpers.l(day, format: "%a %d")
      end

      orders_count_by_day_array = (@begin_date..@end_date).map do |day|
        Order.where(created_at: day.beginning_of_day..day.end_of_day).count
      end

      @orders_data = {
        labels: last_days_array,
        datasets: [{ values:orders_count_by_day_array }]
      }.to_json
    end
  end
end
