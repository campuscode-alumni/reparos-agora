class AddFieldsToEstimate < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :total_hours, :integer
    add_column :estimates, :material_fee, :integer
    add_column :estimates, :service_fee, :integer
    add_column :estimates, :visit_fee, :integer
    add_column :estimates, :material_list, :string
  end
end
