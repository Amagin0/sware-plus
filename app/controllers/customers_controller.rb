class CustomersController < ApplicationController
  before_action :authenticate_customer!, except: %i[show my_recepi my_favorite]
  before_action :set_customer, only: %i[show my_recepi my_favorite edit update]

  def index; end

  def show; end

  def my_recepi
    @sorted_recepis =
      if params[:sort_update]
        Recepi.latest.where(customer_id: @customer.id).includes(:recepi_raties) # 新規順に使用
      elsif params[:sort_top_rate_taste]
        Recepi.top_rate_taste.where(customer_id: @customer.id).includes(:recepi_raties) # 美味しい評価が高い順に使用
      elsif params[:sort_top_rate_fun]
        Recepi.top_rate_fun.where(customer_id: @customer.id).includes(:recepi_raties) # 面白い評価が高い順に使用
      else
        @customer.recepis.includes(:recepi_raties)
      end
  end

  def my_favorite; end

  def edit; end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: '登録情報を変更しました'
    else
      render 'edit'
    end
  end

  def deleted
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
