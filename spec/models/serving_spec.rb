require 'rails_helper'

RSpec.describe Serving, type: :model do
  let(:meal) {
    Meal.create!(
      title: "My meal"
    )
  }

  subject(:serving) {
    Serving.create!(
      best_before: Date.today + 2.days,
      price: 4,
      meal: meal
    )
  }

  describe '#remaining' do
    let(:user) {
      User.create!(
        email: 'user@example.com',
        password: 'password'
      )
    }

    let(:order) {
      Order.create!(
        paid_at: Date.today,
        user: user,
        serving: serving
      )
    }

    before :each do
      serving.quantity = 3
      order.serving = serving
    end

    it 'show remaining servings to order' do
      expect(serving.remaining).to eq(2)
    end
  end
end
