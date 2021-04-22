class DrawingNumbersController < ApplicationController
  def search_number
    r = Product.find_by(name:params[:order][:product_name]).id
    k = Order.(find_by(product_id:r).id).drawing_number_id
    number = DrawingNumber.find_by(id:k)
    render json: { name: number.name}
  end
end
