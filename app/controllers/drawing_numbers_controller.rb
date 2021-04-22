class DrawingNumbersController < ApplicationController
  def search_number
    product_id = Product.find_by(name: params[:product_name])&.id
    drawing_number_id = Order.order(id: :DESC).find_by(product_id: product_id)&.drawing_number_id
    drawing_number_name = DrawingNumber.find_by(id: drawing_number_id)&.name
    render json: { name: drawing_number_name }
  end
end
