class RecepiRatiesController < ApplicationController
  def create
    @recepi = Recepi.find(params[:recepi_id])
    @recepi_raty = RecepiRaty.new(raty_params)
    @recepi_raty.recepi_id = @recepi.id
    @recepi_raty.customer_id = current_customer.id

    if @recepi_raty.save
      redirect_to recepis_path
    else
      redirect_to recepi_path(@recepi), alert: 'Error：0.5以上で評価してください'
    end
  end

  private

  def raty_params
    params.require(:recepi_raty).permit(:recepi_id, :recepi_taste, :recepi_fun, :customer_id)
  end
end
