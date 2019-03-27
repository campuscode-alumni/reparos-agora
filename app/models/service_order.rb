class ServiceOrder < ApplicationRecord
  belongs_to :estimate
  has_one :user
  has_one :contractor
end
