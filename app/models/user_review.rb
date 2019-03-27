class UserReview < ApplicationRecord
  SCORE = 1..5
  belongs_to :user
  belongs_to :service_order
end
