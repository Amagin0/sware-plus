class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer, only: %i[show my_recepi my_favorite edit update]


  def index
  end

  def show
  end

  def my_recepi
    if params[:sort_update]
      @customers = Recepi.latest # 新規順に使用
    elsif params[:sort_top_rate_taste]
      @customers = Recepi.top_rate_taste # 美味しい評価が高い順に使用
    elsif params[:sort_top_rate_fun]
      @customers = Recepi.top_rate_fun # 面白い評価が高い順に使用
    else
      @customers = Recepi.all
    end
  end

  def my_favorite
    # if params[:sort_update]
    #   @customers = Customer.latest
    # elsif params[:sort_top_rate_taste]
    #   @customers = Customer.top_rate_taste
    # elsif params[:sort_top_rate_fun]
    #   @customers = Customer.top_rate_fun
    # else
    #   @customers = Customer.all
    # end
    if params[:sort_update]
      @customers = Recepi.latest # 新規順に使用
    elsif params[:sort_top_rate_taste]
      @customers = Recepi.top_rate_taste # 美味しい評価が高い順に使用
    elsif params[:sort_top_rate_fun]
      @customers = Recepi.top_rate_fun # 面白い評価が高い順に使用
    else
      @customers = Recepi.all
    end
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