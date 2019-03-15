class EstimatesController < ApplicationController
  def new
    @estimate = Estimate.new
    @contractor = Contractor.find(params[:contractor_id])
  end

  def create
    @contractor = Contractor.find(params[:contractor_id])
    @estimate = Estimate.new(estimate_params)
    @estimate.contractor_id = @contractor
    @estimate.save!
      flash[:notice] = "Orçamento solicitado com sucesso!"
      redirect_to @estimate
  end

  private

  def estimate_params
    params.require(:estimate).permit(:contractor_id, :user_id, :description, :location, :service_date, :day_shift, :photo)
  end
end
