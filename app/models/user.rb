class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[slack]

  has_many :orders

  validates :slack_name, presence: true

  def self.from_omniauth(auth)
    where(slack_id: auth['user']['id']).first_or_create do |user|
      user.email = auth['user']['email']
      user.password = Devise.friendly_token[0,20]
      user.slack_name = auth['user']['name']
    end
  end

  def is_admin?
    admin
  end

  def debt
    pro_debt + perso_debt
  end

  def pro_debt
    orders.joins(:serving).not_paid.pro_expenses.sum(:price) * 1.055
  end

  def perso_debt
    orders.joins(:serving).not_paid.perso_expenses.sum(:price)
  end
end
