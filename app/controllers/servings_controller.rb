class ServingsController < ApplicationController
  def index
    @servings             = Serving.orderable.order(:best_before)
    @out_of_date_servings = Serving.out_of_date
    @week_sold_out_servings    = Serving.week_sold_out
  end
end
