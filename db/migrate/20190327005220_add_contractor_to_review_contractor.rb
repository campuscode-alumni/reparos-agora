class AddContractorToReviewContractor < ActiveRecord::Migration[5.2]
  def change
    add_reference :review_contractors, :contractor, foreign_key: true
  end
end
