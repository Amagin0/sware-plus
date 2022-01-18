class RecepisController < ApplicationController
  before_action :set_recepi, only: %i[show edit update destroy]
  impressionist :action => [:show]

  def new
    @recepi = Recepi.new
    @how_to_makes = @recepi.how_to_makes.build # cocoon子要素　作り方
    @recepi_ingredients = @recepi.recepi_ingredients.build # cocoon子要素　材料
    @tags = @recepi.tags.build # cocoon子要素(中間テーブル)
  end

  def index
    @title = "Recipes"
    if params[:sort_update]
      @recepis = Recepi.latest # 新規順に使用
    elsif params[:sort_top_rate_taste]
      @recepis = Recepi.top_rate_taste # 美味しい評価が高い順に使用
    elsif params[:sort_top_rate_fun]
      @recepis = Recepi.top_rate_fun # 面白い評価が高い順に使用
    else
      @recepis = Recepi.all
    end
  end

  def show
    @recepi_comment = RecepiComment.new
    @recepi_raties = RecepiRaty.all
    impressionist(@recepi, nil, unique: [:session_hash.to_s]) # PV数(gem impressionist)
    if RecepiRaty.exists?(customer_id: current_customer.id ,recepi_id: @recepi.id) # 該当レシピのカスタマーidがあるか判定
      @recepi_raty = RecepiRaty.find_by(customer_id: current_customer.id ,recepi_id: @recepi.id) # find_byでひとつだけ取得してくる
    else
      @recepi_raty = RecepiRaty.new
    end
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
                                  recepi_ingredients_attributes: [:id, :ingredient, :_destroy],
                                  tags_attributes: [:id, :genre_id, :_destroy])
  end
end