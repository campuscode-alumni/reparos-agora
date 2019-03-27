class ReviewContractorsController < ApplicationController

  def new
    @service_order = ServiceOrder.find(params[:service_order_id])
    @review_contractor = ReviewContractor.new
  end

  def create
    @service_order = ServiceOrder.find(params[:service_order_id])
    @review_contractor = ReviewContractor.new(review_params)
    @review_contractor.service_order = @service_order
    @review_contractor.contractor = @service_order.estimate.contractor
    @review_contractor.save!
    @service_order.estimate.contractor.update_average
    redirect_to @review_contractor.service_order.estimate.contractor
  end

  private

  def review_params
    params.require(:review_contractor).permit(:grade, :comment)
  end

end