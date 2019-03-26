class CreateProfileSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_sub_categories do |t|
      t.references :profile, foreign_key: true
      t.references :sub_category, foreign_key: true

      t.timestamps
    end
  end
end
