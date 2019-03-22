class ChangeEstimateColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :estimates, :material_fee, :decimal
    change_column :estimates, :service_fee, :decimal
    change_column :estimates, :visit_fee, :decimal
  end
end
