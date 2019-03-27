class UserReview < ApplicationRecord
  SCORE = 1..5
  belongs_to :service_order
  belongs_to :user
end
