class ReviewContractor < ApplicationRecord
  belongs_to :service_order
  belongs_to :contractor
end
