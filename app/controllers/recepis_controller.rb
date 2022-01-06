class RecepisController < ApplicationController
  before_action :set_recepi, only: %i[show edit update destroy]


  def new
    @recepi = Recepi.new
  end

  def index
    @recepi = Recepi.all
  end

  def show
    # impressionist(@recepi, nil, unique: [:session_hash.to_s])
  end

  def edit
  end

  def update
    if @recepi.update(recepi_params)
      redirect_to recepi_path(@recepi), notice: "レシピを編集しました"
    end
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
    @recepi.destroy
    redirect_to recepis_path, notice: "レシピを削除しました"
  end

  private

  def set_recepi
    @recepi = Recepi.find(params[:id])
  end

  def recepi_params
    params.require(:recepi).permit(:recepi_title, :recepi_describe, :recepi_body, :recepi_image)
  end

end
