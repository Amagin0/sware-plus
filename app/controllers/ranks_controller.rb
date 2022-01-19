class RanksController < ApplicationController

  def rank
    @recepis = Recepi.all

    # 月間ランキング(お気に入り数)
    @month_recepi_favorite_ranks = Recepi.find(Favorite.group(:recepi_id).where(created_at: Time.current.all_month).order('count(recepi_id) desc').pluck(:recepi_id))

    # 週間ランキング(お気に入り数)
    @week_recepi_favorite_ranks = Recepi.find(Favorite.group(:recepi_id).where(created_at: Time.current.all_week).order('count(recepi_id) desc').pluck(:recepi_id))
    # recepiモデルから()内のデータを探してくる...Recepi.find()
    # 次にFavoriteモデルのrecepi_idが同じものをまとめる...Favorite.group(:recepi_id)
    # 投稿が作られた日が今週のデータのみ抽出...where(created_at: Time.current.all_week)
    # まとめたものをrecepi_idの多い順に並び替える...order('count(recepi_id) desc')
    # そのままだとFavoriteモデルで取り出してしまうので、recepi_idで値を取りだす...pluck(:recepi_id)

    # 月間ランキング(美味しさ)
    @month_recepi_taste_ranks = Recepi.left_joins(:recepi_raties).where(created_at: Time.current.all_month).order(recepi_taste: :desc).distinct
    # 週間ランキング(美味しさ)
    @week_recepi_taste_ranks = Recepi.left_joins(:recepi_raties).where(created_at: Time.current.all_month).order(recepi_taste: :desc).distinct
    # 月間ランキング(美味しさ)
    @month_recepi_fun_ranks = Recepi.left_joins(:recepi_raties).where(created_at: Time.current.all_month).order(recepi_fun: :desc).distinct
    # 週間ランキング(美味しさ)
    @week_recepi_fun_ranks = Recepi.left_joins(:recepi_raties).where(created_at: Time.current.all_month).order(recepi_fun: :desc).distinct

  end
end
