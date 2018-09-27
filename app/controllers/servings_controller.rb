class ServingsController < ApplicationController
  def index
    @servings                    = Serving.orderable.order(:best_before)
    @out_of_date_servings        = Serving.out_of_date
    @servings_sold_out_this_week = Serving.sold_out_this_week
  end
end
