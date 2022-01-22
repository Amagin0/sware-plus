class SearchesController < ApplicationController
  def search
    if (params[:keyword]).present?
      if (params[:keyword])[0] == '#'
        @recepis = Genre.search(params[:keyword]).order('created_at DESC')
        @title = params[:keyword]
        render 'recepis/index.html.erb'
        # 検索内容の初めに # がついている場合はジャンル検索=>ジャンルモデル
      else
        @recepis = Recepi.search(params[:keyword]).order('created_at DESC')
        @title = params[:keyword]
        render 'recepis/index.html.erb'
        # #がついていない場合はキーワード検索にわけている=>レシピモデル
      end
    else
      @title = ヒットしませんでした
      render 'recepis/index.html.erb'
    end
  end
end
