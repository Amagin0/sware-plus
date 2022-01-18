class SearchesController < ApplicationController
  def search
    keyword = params["keyword"]
    @recepis = Recepi.where("recepi_title LIKE?", '%'+keyword+'%')
    @genres = Genre.all
    @title = keyword
    render "recepis/index.html.erb"
  end
end