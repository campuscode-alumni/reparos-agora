class CreateServiceOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :service_orders do |t|
      t.references :estimate, foreign_key: true

      t.timestamps
    end
  end
end
