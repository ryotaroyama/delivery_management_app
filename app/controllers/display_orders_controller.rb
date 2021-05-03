class DisplayOrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
    order = Order.find(params[:order_id])
    order.update!(display: false)
  end
end
