class Order < ApplicationRecord
  belongs_to :serving
  belongs_to :user

  scope :paid,     -> { where.not(paid_at: nil) }
  scope :not_paid, -> { where(paid_at: nil) }
  scope :pro_expenses, -> { where(pro_expense: true) }
  scope :perso_expenses, -> { where(pro_expense: false) }
end
