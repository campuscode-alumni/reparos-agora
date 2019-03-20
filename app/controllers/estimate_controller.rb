class EstimateController < ApplicationController
  def index
    @estimates = Estimate.all
  end

  def show
    @estimate = Estimate.find(params[:id])
  end

  def update
    @estimate = Estimate.find(params[:id])
    if @estimate.update(params_update)
      flash[:notice] = 'Orçamento enviado'
      redirect_to @estimate
    else
      flash[:notice] = 'Não foi possivel salvar'
      render :show
    end
  end

  private

  def params_update
    params.require(:estimate).permit(:total_hours, :material_list,
                                     :material_fee, :visit_fee,
                                                      :service_fee)
  end
end