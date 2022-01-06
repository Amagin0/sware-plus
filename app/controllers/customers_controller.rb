class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def index
    @customer = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
  end

  def destroy
  end

end
