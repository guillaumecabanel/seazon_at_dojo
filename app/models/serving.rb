class Serving < ApplicationRecord
  belongs_to :meal
  has_many :orders

  def remaining
    quantity - orders.count
  end
end
