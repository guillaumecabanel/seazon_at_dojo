class Serving < ApplicationRecord
  belongs_to :meal
  has_many :orders

  scope :orderable,           -> {  left_joins(:orders).
                                    where("best_before >= ?", Date.today).
                                    group("servings.id").
                                    having("servings.quantity > COUNT(orders.id)") }

  scope :out_of_date,         -> {  not_sold_out.where("best_before < ?", Date.today) }

  scope :sold_out,            -> {  joins(:orders).
                                    group("servings.id").
                                    having("servings.quantity <= COUNT(orders.id)") }

  scope :sold_out_this_week,  -> {  joins(:orders).
                                    group("servings.id").
                                    having("servings.quantity <= COUNT(orders.id)").
                                    where("servings.created_at >= ?", last_monday) }

  scope :not_sold_out,        -> {  joins(:orders).
                                    group("servings.id").
                                    having("servings.quantity > COUNT(orders.id)") }

  def remaining
    quantity - orders.count
  end

  def self.last_monday
    Date.today - (Date.today.wday - 1).days
  end
end
