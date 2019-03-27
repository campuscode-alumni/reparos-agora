class ServiceOrder < ApplicationRecord
  belongs_to :estimate
  has_one :user_review
end
