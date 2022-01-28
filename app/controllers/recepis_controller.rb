class RecepisController < ApplicationController
  before_action :authenticate_customer!, except: %i[index show]
  before_action :set_recepi, only: %i[edit update destroy]
  impressionist action: [:show]

  def new
    @recepi = Recepi.new
    @how_to_makes = @recepi.how_to_makes.build # cocoon子要素　作り方
    @recepi_ingredients = @recepi.recepi_ingredients.build # cocoon子要素　材料
    @tags = @recepi.tags.build # cocoon子要素(中間テーブル)
  end

  def index
    @title = 'Recipes'
    @recepis = if params[:sort_update]
                 Recepi.latest # 新規順に使用
               elsif params[:sort_top_rate_taste]
                 Recepi.top_rate_taste # 美味しい評価が高い順に使用
               elsif params[:sort_top_rate_fun]
                 Recepi.top_rate_fun # 面白い評価が高い順に使用
               else
                 Recepi.all
               end
               
    # if (params[:keyword]).present?
    #   if (params[:keyword])[0] == '#'
    #     @recepis = Genre.search(params[:keyword]).order('created_at DESC')
    #     @title = params[:keyword]
    #     render 'recepis/index.html.erb'
    #     # 検索内容の初めに # がついている場合はジャンル検索=>ジャンルモデル
    #   else
    #     @recepis = Recepi.search(params[:keyword]).order('created_at DESC')
    #     @title = params[:keyword]
    #     render 'recepis/index.html.erb'
    #     # #がついていない場合はキーワード検索にわけている=>レシピモデル
    #   end
    # else
    #   render 'recepis/index.html.erb'
    # end

  end

  def show
    @recepi = Recepi.find(params[:id])
    @recepi_comment = RecepiComment.new
    @recepi_raties = RecepiRaty.all
    impressionist(@recepi, nil, unique: [:session_hash.to_s]) # PV数(gem impressionist)
    if customer_signed_in?
      # @recepi_raty = if RecepiRaty.exists?(customer_id: current_customer.id, recepi_id: @recepi.id)
      #                 RecepiRaty.find_by(customer_id: current_customer.id, recepi_id: @recepi.id)
      #               else
      #                 RecepiRaty.new
      #               end
      @recepi_raty = recepi_raty(current_customer.id, @recepi.id)
    end
  end

    # 無理やりクラスメソッド化してみた例
  def recepi_raty(customer_id, recepi_id)
    _recepi_raty = if RecepiRaty.exists?(customer_id: customer_id, recepi_id: recepi_id) # 該当レシピのカスタマーidがあるか判定
                     RecepiRaty.find_by(customer_id: customer_id, recepi_id: recepi_id) # find_byでひとつだけ取得してくる
                   else
                     RecepiRaty.new
                   end
    _recepi_raty
  end

  def edit; end

  def update
    if @recepi.update(recepi_params)
      redirect_to recepi_path(@recepi)
    end
  end

  def create
    @recepi = Recepi.new(recepi_params)
    @recepi.customer_id = current_customer.id
    if @recepi.save
      redirect_to recepi_path(@recepi)
    else
      @recepis = Recepi.all
      render 'new'
    end
  end

  def destroy
    @recepi.destroy
    redirect_to recepis_path
  end

  private

  def set_recepi
    @recepi = Recepi.find(params[:id])
  end

  def recepi_params
    params.require(:recepi).permit(:recepi_title, :recepi_image,
                                  how_to_makes_attributes: %i[id recepi_make how_to_image _destroy],
                                  recepi_ingredients_attributes: %i[id ingredient _destroy],
                                  tags_attributes: %i[id genre_id _destroy])
  end
end