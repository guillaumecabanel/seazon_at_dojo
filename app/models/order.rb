class Order < ApplicationRecord
  belongs_to :serving
  belongs_to :user
end
