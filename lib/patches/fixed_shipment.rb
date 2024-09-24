module Patches
  class FixedShipment < Fedex::Shipment
    def self.find(fedex_id)
      shipment = @shipments[fedex_id.to_i] if @shipments

      raise Fedex::ShipmentNotFound, "Shipment not found: #{fedex_id}" if shipment.blank?

      shipment.status = STATUS.sample

      shipment
    end
  end
end
