class OrdersController < ApplicationController
  def index
    @customers = Customer.order(id: :asc)
  end

  def new
    @order = Order.new
    @customer_names = Customer.pluck(:name)
    @processor_names = Processor.pluck(:name)
    @product_names = Product.pluck(:name)
    @product_drawing_numbers = Product.pluck(:drawing_number)
  end

  def create
    customer = Customer.find_or_create_by!(customer_params)
    processor = Processor.find_or_create_by!(processor_params)

    drawing_number = params[:order][:drawing_number]
    product = Product.find_or_create_by(product_params) do |product|
      product.drawing_number = drawing_number
    end

    unless product.drawing_number == drawing_number
      product.update!(drawing_number: drawing_number)
    end

    order = Order.new(order_params)
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

    def order_params
      params.require(:order).permit(:delivery_date, :process, :drawing_number, :comment)
    end
end
