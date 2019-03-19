class AddTitleToEstimate < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :title, :string
  end
end
