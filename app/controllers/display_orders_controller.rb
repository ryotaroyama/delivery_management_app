class DisplayOrdersController < ApplicationController

  def create
    # order = Order.find(params[:order_id])
  end

  def destroy
    order = Order.find(params[:order_id])
    order.update!(display: false)
    render json: { order_id: order.id }
  end
end
