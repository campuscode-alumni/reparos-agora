class EstimateController < ApplicationController
  def index
    @estimates = Estimate.all
  end

  def show
    @estimate = Estimate.find(params[:id])
  end
end