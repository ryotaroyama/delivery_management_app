class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update]
  before_action :set_relations, only: %i[show edit]

  def index
    column = 'orders.id, orders.delivery_date, orders.comment, customers.name as customer_name, products.name as product_name'
    # 表示・非表示の設定
    @display = params[:display] != 'none'
    @orders = Order.where(display: @display).joins(:customer, :product).select(column).order(delivery_date: :asc, created_at: :asc)
  end

  def new
    @order = Order.new
    @customer_names = Customer.pluck(:name)
    @processor_names = Processor.pluck(:name)
    @product_names = Product.pluck(:name)
  end

  def create
    @order = Order.new(order_params)
    set_order_params
    @order.save!
    redirect_to orders_path
  end

  def show; end

  def edit
    @customer_names = Customer.pluck(:name)
    @product_names = Product.pluck(:name)
    @processor_names = Processor.pluck(:name)
  end

  def update
    set_order_params
    @order.drawing_number_id = nil if drawing_number_params[:name].blank?
    @order.update!(order_params)
    redirect_to orders_path
  end

  private

  def set_order_params
    customer = Customer.find_or_create_by!(customer_params)
    processor = Processor.find_or_create_by!(processor_params)
    product = Product.find_or_create_by!(product_params)

    @order.customer_id = customer.id
    @order.product_id = product.id
    @order.processor_id = processor.id

    set_drawing_number
  end

  def set_drawing_number
    return if drawing_number_params[:name].blank?

    drawing_number = DrawingNumber.find_or_create_by!(drawing_number_params)
    @order.drawing_number_id = drawing_number.id
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def set_relations
    @customer = @order.customer
    @product = @order.product
    @processor = @order.processor
    @drawing_number = @order.drawing_number
  end

  def customer_params
    params.require(:customer).permit(:name)
  end

  def processor_params
    params.require(:processor).permit(:name)
  end

  def product_params
    params.require(:product).permit(:name)
  end

  def drawing_number_params
    params.require(:drawing_number).permit(:name)
  end

  def order_params
    params.require(:order).permit(:delivery_date, :process, :comment)
  end
end
