class OrdersMailer < ApplicationMailer
  def status_update_summary(processed_count:)
    @processed_count = processed_count
    mail(
      to: ENV['OPERATIONS_MANAGER_EMAIL'],
      subject: 'Orders Status Update Summary'
    )
  end
end
