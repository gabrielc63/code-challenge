require 'rails_helper'

RSpec.describe UpdateShippingStatusJob, type: :job do
  describe '#perform' do
    let!(:processing_order) { create(:order, status: 'processing') }
    let!(:awaiting_pickup_order) { create(:order, status: 'awaiting_pickup', fedex_id: 1) }
    let!(:in_transit_order) { create(:order, status: 'in_transit', fedex_id: 2) }
    let!(:delivered_order) { create(:order, status: 'delivered', fedex_id: 3) }

    before do
      allow(Patches::FixedShipment).to receive(:find).and_return(
        double(status: 'in_transit'),
        double(status: 'delivered')
      )
    end

    it 'updates statuses for non-processing and non-delivered orders' do
      expect do
        UpdateShippingStatusJob.new.perform
      end.to change { awaiting_pickup_order.reload.status }.from('awaiting_pickup').to('in_transit')
                                                           .and change {
                                                                  in_transit_order.reload.status
                                                                }.from('in_transit').to('delivered')

      expect(processing_order.reload.status).to eq('processing')
      expect(delivered_order.reload.status).to eq('delivered')
    end
  end
end
