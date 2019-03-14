class AddCategoryRefToContractor < ActiveRecord::Migration[5.2]
  def change
    add_reference :contractors, :category, foreign_key: true
  end
end
