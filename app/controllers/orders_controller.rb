class OrdersController < ApplicationController
  def index
    @orders = Order.joins(:customer).select("orders.id, orders.delivery_date, customers.name as customer_name ").order(delivery_date: :asc)
  end

  def new
    @order = Order.new
    @customer_names = Customer.pluck(:name)
    @processor_names = Processor.pluck(:name)
    @product_names = Product.pluck(:name)
  end

  def create
    customer = Customer.find_or_create_by!(customer_params)
    processor = Processor.find_or_create_by!(processor_params)
    product = Product.find_or_create_by!(product_params)
    drawing_number = nil

    order = Order.new(order_params)
    if drawing_number_params[:name].present?
      drawing_number = DrawingNumber.find_or_create_by!(drawing_number_params)
      order.drawing_number_id = drawing_number.id
    end

    order.customer_id = customer.id
    order.product_id = product.id
    order.processor_id = processor.id
    order.save!
    redirect_to orders_path
  end

  # def show
  #   # @product = Product.find(params[:id])
  # end

  def edit
    @order = Order.find(params[:id])
    @customer_names = Customer.pluck(:name)
    @product_names = Product.pluck(:name)
    @processor_names = Processor.pluck(:name)

    @customer = @order.customer
    @product = @order.product
    @processor = @order.processor
    @drawing_number = @order.drawing_number
  end

  def update
    order = Order.find(params[:id])
    order.customer_id = Customer.find_or_create_by!(customer_params).id
    order.product_id = Product.find_or_create_by!(product_params).id
    order.processor_id = Processor.find_or_create_by!(processor_params).id
    order.drawing_number_id = DrawingNumber.find_or_create_by!(drawing_number_params).id
    order.update!(order_params)
    redirect_to orders_path
  end

  # def destroy
  # end

  private

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
