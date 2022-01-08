class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer, only: %i[show my_recepi edit update]

  def index
    @customer = Customer.all
  end

  def show
  end

  def my_recepi
    @average_taste = @customer.recepis.average(:raty_taste).round(1)
    @average_fun = @customer.recepis.average(:raty_fun).round(1)
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
    # @customer = Customer.find(params[:id])
    @customer = current_customer
  end
end