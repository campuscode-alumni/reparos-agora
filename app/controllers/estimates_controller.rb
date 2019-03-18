class EstimatesController < ApplicationController
  def new
    @estimate = Estimate.new
    @contractor = Contractor.find(params[:contractor_id])
  end

  def create
    @user = current_user
    @contractor = Contractor.find(params[:contractor_id])
    @estimate = @contractor.estimates.new(estimate_params)
    @estimate.user = @user
    @estimate.save!
    flash[:notice] = "Orçamento solicitado com sucesso!"
    redirect_to @estimate
  end

  def show
    @estimate = Estimate.find_by(params[:id])
  end

  private

  def estimate_params
    params.require(:estimate).permit(:title, :description, :location, :service_date, :day_shift, :photo)
  end
end
