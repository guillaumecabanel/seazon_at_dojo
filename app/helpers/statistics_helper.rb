module StatisticsHelper

  def title_for_orders_by_day(begin_date, end_date, orders_count)
    if end_date.today?
      description = "depuis #{distance_of_time_in_words(begin_date.beginning_of_day, end_date.end_of_day)}"
    else
      if begin_date == end_date
       description = "le #{l(begin_date, format: "%d.%m.%Y")}"
      else
        description = "sur #{distance_of_time_in_words(begin_date.beginning_of_day, end_date.end_of_day)} entre le #{l(begin_date, format: "%d.%m.%Y")} et le #{l(end_date, format: "%d.%m.%Y")}"
      end
    end

    "#{t('misc.orders', count: orders_count)} #{description}"
  end
end
