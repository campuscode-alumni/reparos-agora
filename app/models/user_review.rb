class UserReview < ApplicationRecord
  SCORE = 0..5
  belongs_to :user
  belongs_to :service_order
end
