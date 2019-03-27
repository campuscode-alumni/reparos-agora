class AddAverageToContractor < ActiveRecord::Migration[5.2]
  def change
    add_column :contractors, :average, :decimal
  end
end
