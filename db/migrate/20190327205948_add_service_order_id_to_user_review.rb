class AddServiceOrderIdToUserReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_reviews, :service_order, foreign_key: true
  end
end
