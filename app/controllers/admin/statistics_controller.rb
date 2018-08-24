module Admin
  class StatisticsController < Admin::BaseController
    def show
      last_days_array = ((Date.today - 14.days)..Date.today).map do |day|
        helpers.l(day, format: "%a %d")
      end
      @last_days = last_days_array.join(',')

      orders_count_by_day_array = ((Date.today - 14.days)..Date.today).map do |day|
        Order.where(created_at: day.beginning_of_day..day.end_of_day).count
      end

      @orders_count_by_day = orders_count_by_day_array.join(',')
    end
  end
end
