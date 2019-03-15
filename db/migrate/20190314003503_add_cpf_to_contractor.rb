class AddCpfToContractor < ActiveRecord::Migration[5.2]
  def change
    add_column :contractors, :cpf, :string
  end
end
