class ServingsController < ApplicationController
  def index
    @servings             = Serving.orderable.order(:best_before)
    @out_of_date_servings = Serving.out_of_date
    @sold_out_servings    = Serving.sold_out
  end
end
