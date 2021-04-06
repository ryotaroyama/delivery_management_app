class CustomersController < ApplicationController
  def index
    @customers = Customer.order(id: :asc)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
