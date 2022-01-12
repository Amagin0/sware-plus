class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer, only: %i[show my_recepi my_favorite edit update]

  def index
  end

  def show
  end

  def my_recepi
    if params[:sort_update]
      @sorted_recepis = Recepi.latest.where(customer_id: @customer.id) # 新規順に使用
    elsif params[:sort_top_rate_taste]
      @sorted_recepis = Recepi.top_rate_taste.where(customer_id: @customer.id) # 美味しい評価が高い順に使用
    elsif params[:sort_top_rate_fun]
      @sorted_recepis = Recepi.top_rate_fun.where(customer_id: @customer.id) # 面白い評価が高い順に使用
    else
      @sorted_recepis = @customer.recepis
    end
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