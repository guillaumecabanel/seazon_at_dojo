class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :invitable,
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
