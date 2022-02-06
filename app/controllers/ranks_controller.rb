class RanksController < ApplicationController
  def rank
    @recepis = Recepi.all

    # 月間ランキング(お気に入り数)
    @month_recepi_favorite_ranks = Recepi.includes(:recepi_raties).find(Favorite.group(:recepi_id).where(created_at: Time.current.all_month).order('count(recepi_id) desc').pluck(:recepi_id))

    # 週間ランキング(お気に入り数)
    @week_recepi_favorite_ranks = Recepi.includes(:recepi_raties).find(Favorite.group(:recepi_id).where(created_at: Time.current.all_week).order('count(recepi_id) desc').pluck(:recepi_id))
    # recepiモデルから()内のデータを探してくる...Recepi.find()
    # 次にFavoriteモデルのrecepi_idが同じものをまとめる...Favorite.group(:recepi_id)
    # 投稿が作られた日が今週のデータのみ抽出...where(created_at: Time.current.all_week)
    # まとめたものをrecepi_idの多い順に並び替える...order('count(recepi_id) desc')
    # そのままだとFavoriteモデルで取り出してしまうので、recepi_idで値を取りだす...pluck(:recepi_id)

    @recepi_ranks_week = Recepi.left_joins(:recepi_raties).where(created_at: Time.current.all_week).includes(:recepi_raties)
    @recepi_ranks_month = Recepi.left_joins(:recepi_raties).where(created_at: Time.current.all_month).includes(:recepi_raties)
    # 月間ランキング(美味しさ)
    @month_recepi_taste_ranks = @recepi_ranks_month.order(recepi_taste: :desc).distinct
    # 週間ランキング(美味しさ)
    @week_recepi_taste_ranks = @recepi_ranks_week.order(recepi_taste: :desc).distinct
    # 月間ランキング(面白さ)
    @month_recepi_fun_ranks = @recepi_ranks_month.order(recepi_fun: :desc).distinct
    # 週間ランキング(面白さ)
    @week_recepi_fun_ranks = @recepi_ranks_week.order(recepi_fun: :desc).distinct
  end
end