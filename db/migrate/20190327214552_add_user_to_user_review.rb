class AddUserToUserReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_reviews, :user, foreign_key: true
  end
end
