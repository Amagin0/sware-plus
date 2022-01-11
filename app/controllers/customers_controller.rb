class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer, only: %i[show my_recepi my_favorite edit update]


  def index
  end

  def show
  end

  def my_recepi
  end

  def my_favorite
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
    @customer = Customer.find(params[:id])
  end
end