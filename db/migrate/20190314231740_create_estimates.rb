class CreateEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.references :contractor, foreign_key: true
      t.references :user, foreign_key: true
      t.text :description
      t.string :location
      t.datetime :service_date
      t.string :day_shift

      t.timestamps
    end
  end
end
