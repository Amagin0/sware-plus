class RecepisController < ApplicationController
  def new
    @recepi = Recepi.new
  end

  def index
    @recepi = Recepi.all
  end

  def show
    @recepi = Recepi.find(params[:id])
    # impressionist(@recepi, nil, unique: [:session_hash.to_s])
  end

  def create
    @recepi = Recepi.new(recepi_params)
    @recepi.customer_id = current_customer.id
    if @recepi.save
      redirect_to recepi_path(@recepi), notice: "新しいレシピを作成しました"
    else
      @recepis = Recepi.all
      render 'index'
    end
  end

  def destroy
  end

  private

  def recepi_params
    params.require(:recepi).permit(:recepi_title, :recepi_describe, :recepi_body, :recepi_image)
  end

end
