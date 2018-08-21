class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders

  validates :slack_name, presence: true

  def is_admin?
    admin
  end

  def debt
    orders.joins(:serving).where(paid_at: nil).sum(:price)
  end
end
