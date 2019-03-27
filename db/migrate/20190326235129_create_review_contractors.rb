class CreateReviewContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :review_contractors do |t|
      t.integer :grade
      t.text :comment
      t.references :service_order, foreign_key: true

      t.timestamps
    end
  end
end
