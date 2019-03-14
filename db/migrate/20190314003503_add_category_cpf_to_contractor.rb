class AddCategoryCpfToContractor < ActiveRecord::Migration[5.2]
  def change
    add_reference :contractors, :category, foreign_key: true
    add_column :contractors, :cpf, :string
  end
end
