module Admin
  class StatisticsController < Admin::BaseController
    def show
      last_days_array = ((Date.today - 14.days)..Date.today).map do |day|
        helpers.l(day, format: "%a %d")
      end

      orders_count_by_day_array = ((Date.today - 14.days)..Date.today).map do |day|
        Order.where(created_at: day.beginning_of_day..day.end_of_day).count
      end

      @orders_data = {
        labels: last_days_array,
        datasets: [
            { values:orders_count_by_day_array }
        ]
      }.to_json
    end
  end
end
