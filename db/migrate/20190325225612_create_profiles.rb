class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :contractor, foreign_key: true
      t.string :city

      t.timestamps
    end
  end
end
