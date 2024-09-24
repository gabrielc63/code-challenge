class Admin::OrdersController < AdminController
  def index
    @orders = Order.all
                   .filter_by_status(params[:status])
                   .filter_by_customer_name(params[:customer_name])
                   .filter_by_date_range(params[:start_date], params[:end_date])
                   .sort_by_field(params[:sort], params[:direction])

    @orders = @orders.paginate(page: params[:page], per_page: 20)
  end
end
