class GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
    @recepis = Recepi.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      @genres = Genre.all
    else
      render 'index'
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    if @genre.destroy
      @genres = Genre.all
    else
      render 'index'
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
