class ServiceOrder < ApplicationRecord
  belongs_to :estimate
  has_one :review_contractor
end
