class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    binding.pry
    customer = Customer.find_or_create_by!(customer_params)
    processor = Processor.find_or_create_by!(processor_params)

    # product = Product.create!(product_params)
    # redirect_to customer
  end

  def show
    # @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update!(product_params)
    redirect_to customer
  end

  def destroy
  end

  private

    def product_params
      params.require(:product).permit(:name, :process, :delivery_date, :drawing_number, :comment)
    end

    def customer_params
      params.require(:customer).permit(:name)
    end

    def processor_params
      params.require(:processor).permit(:name)
    end
end
