class ServingsController < ApplicationController
  def index
    if current_user.is_admin?
      @servings = Serving.all
    else
      @servings = Serving.orderable.order(:best_before)
    end
  end
end
