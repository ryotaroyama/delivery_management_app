class OrdersController < ApplicationController
  def index
    @customers = Customer.order(id: :asc)
  end

  # def new
  #   @product = Product.new
  #   @customer_names = Customer.pluck(:name)
  #   @processor_names = Processor.pluck(:name)
  #   @product_names = Product.pluck(:name)
  # end

  # def create
  #   customer = Customer.find_or_create_by!(customer_params)
  #   processor = Processor.find_or_create_by!(processor_params)
  #   product = Product.new(product_params)
  #   product.customer_id = customer.id
  #   product.processor_id = processor.id
  #   product.save!
  #   redirect_to customers_path
  # end

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

  # private

  #   def product_params
  #     params.require(:product).permit(:name, :process, :delivery_date, :drawing_number, :comment)
  #   end

  #   def customer_params
  #     params.require(:customer).permit(:name)
  #   end

  #   def processor_params
  #     params.require(:processor).permit(:name)
  #   end
end
