class EstimatesController < ApplicationController 

  def index
    @estimates = Estimate.all
  end

  def show
    @estimate = Estimate.find(params[:id])
  end

  def approve
    @estimate = Estimate.find(params[:id])
    EstimatesMailer.notify_approved(@estimate.id, @estimate.contractor.email)
    @estimate.update(approved: true)
    flash[:notice] =  'Prestador de serviço será notificado'
    redirect_to @estimate
  end

end
