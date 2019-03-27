class AddScoreAndCommentToUserReview < ActiveRecord::Migration[5.2]
  def change
    add_column :user_reviews, :score, :integer
    add_column :user_reviews, :comment, :text
  end
end
