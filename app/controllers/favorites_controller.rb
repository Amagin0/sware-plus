class FavoritesController < ApplicationController

  def create
    @recepi = Recepi.find(params[:recepi_id])
    favorite = @recepi.favorites.new(customer_id: current_customer.id)
    favorite.save
  end

  def destroy
    @recepi = Recepi.find(params[:recepi_id])
    favorite = @recepi.favorites.find_by(customer_id: current_customer.id)
    favorite.destroy
  end
end