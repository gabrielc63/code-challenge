# Preview all emails at http://localhost:3000/rails/mailers/orders
class OrdersPreview < ActionMailer::Preview
  def orders_email
    OrdersMailer.status_update_summary(processed_count: 1000)
  end
end
