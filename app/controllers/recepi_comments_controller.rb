class RecepiCommentsController < ApplicationController
  before_action :set_recepi_comment, only: %i[create destroy]

  def create
    @recepi_comment = RecepiComment.new(recepi_comment_params)
    @recepi_comment.recepi_id = @recepi.id
    @recepi_comment.customer_id = current_customer.id
    if @recepi_comment.save
      flash.now[:notice] = 'コメントを投稿しました'
    end
  end

  def destroy
    @recepi_comment = @recepi.recepi_comments.find(params[:id])
    @recepi_comment.destroy
    redirect_back(fallback_location: root_url)
  end

  private

  def set_recepi_comment
    @recepi = Recepi.find(params[:recepi_id])
  end

  def recepi_comment_params
    params.require(:recepi_comment).permit(:comment)
  end
end
