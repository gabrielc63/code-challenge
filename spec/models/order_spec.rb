require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { build(:order) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(order).to be_valid
    end

    it 'is not valid without a customer name' do
      order.customer_name = nil
      expect(order).to_not be_valid
    end

    it 'is not valid with an invalid status' do
      order.save
      order.status = 'invalid_status'
      expect(order).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a product' do
      expect(Order.reflect_on_association(:product).macro).to eq :belongs_to
    end
  end

  describe 'default values' do
    it 'sets status to processing by default' do
      new_order = Order.new
      expect(new_order.status).to eq 'processing'
    end
  end
end
