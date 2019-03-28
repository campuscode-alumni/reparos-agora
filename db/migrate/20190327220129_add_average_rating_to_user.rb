class AddAverageRatingToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :average_rating, :decimal
  end
end
