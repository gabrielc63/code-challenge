class OrdersController < ApplicationController
  def new
    @products = Product.all
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: 'The order was successfully created.'
    else
      @products = Product.all
      render :new
    end
  end

  def show
    @order = Order.where(id: params[:id]).first
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :customer_name)
  end
end
