require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'POST /orders' do
    let(:product) { create(:product) }
    let(:valid_attributes) do
      {
        product_id: product.id,
        customer_name: 'Javier Saviola'
      }
    end

    context 'with valid parameters' do
      it 'creates a new Order' do
        expect do
          post orders_path, params: { order: valid_attributes }
        end.to change(Order, :count).by(1)
      end

      it 'redirects to the created order' do
        post orders_path, params: { order: valid_attributes }
        expect(response).to redirect_to(Order.last)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Order' do
        expect do
          post orders_path, params: { order: valid_attributes.merge(customer_name: nil) }
        end.to change(Order, :count).by(0)
      end

      it "renders the 'new' template" do
        post orders_path, params: { order: valid_attributes.merge(customer_name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end
end
