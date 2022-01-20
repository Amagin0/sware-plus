class RelationshipsController < ApplicationController
  # フォローするとき
  def create
    current_customer.follow(params[:customer_id])
    @customer = Customer.find(params[:customer_id])
  end

  # フォローを外すとき
  def destroy
    current_customer.unfollow(params[:customer_id])
    @customer = Customer.find(params[:customer_id])
  end

  # フォロー一覧
  def followings
    customer = Customer.find(params[:customer_id])
    @customers = customer.followings
  end

  # フォロワー一覧
  def followers
    customer = Customer.find(params[:customer_id])
    @customers = customer.followers
  end
end
