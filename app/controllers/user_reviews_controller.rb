class UserReviewsController < ApplicationController
  def new
    @service_order = ServiceOrder.find(params[:service_order_id])
    @user_review = UserReview.new
  end

  def create
    @service_order = ServiceOrder.find(params[:service_order_id])
    @user_review = UserReview.new(params.require(:user_review).permit(:score, :comment))
    
    @user_review.service_order = @service_order
    @user_review.user = @service_order.estimate.user 
    
    @user_review.save!
    redirect_to user_path(@service_order.estimate.user)
    
  end
end