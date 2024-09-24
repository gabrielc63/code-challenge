class UpdateShippingStatusJob < ActiveJob::Base
  queue_as :default

  def perform
    processed_count = 0

    Order.where.not(status: %w[processing delivered])
         .select(:id, :status, :fedex_id)
         .find_in_batches(batch_size: 1000) do |batch|
      batch.each do |order|
        update_order_status(order)
        processed_count += 1
      rescue StandardError => e
        Rails.logger.error("Failed to update status for order #{order.id}: #{e.message}")
      end
    end

    send_summary_email(processed_count) if processed_count > 0
  end

  private

  def update_order_status(order)
    fedex_status = get_fedex_status(order)
    return if fedex_status == order.status

    Order.where(id: order.id).update_all(status: fedex_status)
  end

  def get_fedex_status(order)
    shipment = Patches::FixedShipment.find(order.fedex_id)
    shipment.status
  rescue Fedex::ShipmentNotFound
    shipment = Patches::FixedShipment.create
    Order.where(id: order.id).update_all(fedex_id: shipment.id.to_s)
    shipment.status
  end

  def send_summary_email(processed_count)
    OrdersMailer.status_update_summary(
      processed_count: processed_count
    ).deliver_later
  end
end
