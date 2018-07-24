class ServingsController < ApplicationController
  def index
    if current_user.is_admin?
      @servings = Serving.all
    else
      # TODO: Give only DLC ok and Remaining quantity OK
      @servings = Serving.left_joins(:orders).
                          where("best_before >= ?", Date.today).
                          group("servings.id").
                          having("servings.quantity > COUNT(orders.id)")
    end
  end
end
