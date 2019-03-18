class EstimatesController < ApplicationController 

  def index
    @estimates = Estimate.all
  end

  def show
    @estimate = Estimate.find(params[:id])
  end

  def approve
    @estimate = Estimate.find(params[:id])
    @estimate.update(approved: true)
    redirect_to @estimate
  end

end
