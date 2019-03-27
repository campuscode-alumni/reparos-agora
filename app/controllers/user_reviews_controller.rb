class UserReviewsController < ApplicationController
  def new
    @service_order = ServiceOrder.find(params[:service_order_id])
    @user_review = UserReview.new
  end

  def create
    @service_order = ServiceOrder.find(params[:service_order_id])
    @user_review = UserReview.new(params_user)
    @user_review.service_order = @service_order
    @user_review.user = @service_order.estimate.user
    @user_review.save
    redirect_to user_path(@user_review.user)
  end

  private

  def params_user
    params.require(:user_review).permit(:score, :comment)
  end
end