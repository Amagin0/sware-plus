class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer, only: %i[show edit update]

  def index
    @customer = Customer.all
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: "登録情報を変更しました"
    else
      render 'edit'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end

  def set_customer
    @customer = current_customer
  end
end