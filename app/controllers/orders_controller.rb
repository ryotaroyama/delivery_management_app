class OrdersController < ApplicationController
  def index
    @customers = Customer.order(id: :asc)
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

  # def edit
  #   @product = Product.find(params[:id])
  # end

  # def update
  #   product = Product.find(params[:id])
  #   product.update!(product_params)
  #   redirect_to customers_path
  # end

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
