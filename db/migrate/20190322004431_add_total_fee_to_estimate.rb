class AddTotalFeeToEstimate < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :total_fee, :decimal
  end
end
