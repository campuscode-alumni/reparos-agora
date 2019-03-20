class ChangeColumnFromEstimates < ActiveRecord::Migration[5.2]
  def change
    change_column :estimates, :service_date, :date
  end
end
