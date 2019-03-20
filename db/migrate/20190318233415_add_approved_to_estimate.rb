class AddApprovedToEstimate < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :approved, :boolean
  end
end
