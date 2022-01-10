class RecepisController < ApplicationController
  before_action :set_recepi, only: %i[show edit update destroy]

  def new
    @recepi = Recepi.new
    @how_to_makes = @recepi.how_to_makes.build
    @recepi_ingredients = @recepi.recepi_ingredients.build
  end

  def index
    @recepis = Recepi.all

  end

  def show
    @recepi_comment = RecepiComment.new
    if RecepiRaty.exists?(customer_id: current_customer.id ,recepi_id: @recepi.id)
      @recepi_raty = RecepiRaty.find_by(customer_id: current_customer.id ,recepi_id: @recepi.id)
    else
      @recepi_raty = RecepiRaty.new
    end
    @recepi_raties = RecepiRaty.all
    # impressionist(@recepi, nil, unique: [:session_hash.to_s])
  end

  def edit
  end

  def update
    if @recepi.update(recepi_params)
      redirect_to recepi_path(@recepi), notice: "レシピを更新しました"
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
    params.require(:recepi).permit(:recepi_title, :recepi_image,
                                  how_to_makes_attributes: [:id , :recepi_make, :_destroy],
                                  recepi_ingredients_attributes: [:id, :ingredient, :_destroy])
  end

end

