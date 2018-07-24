class Serving < ApplicationRecord
  belongs_to :meal
  has_many :orders

  scope :orderable,   -> {  left_joins(:orders).
                            where("best_before >= ?", Date.today).
                            group("servings.id").
                            having("servings.quantity > COUNT(orders.id)") }

  scope :out_of_date, -> {  where("best_before < ?", Date.today) }

  scope :sold_out,    -> {  joins(:orders).
                            group("servings.id").
                            having("servings.quantity <= COUNT(orders.id)") }

  def remaining
    quantity - orders.count
  end
end
