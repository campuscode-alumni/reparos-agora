class Estimate < ApplicationRecord
  SHIFTS = ["Manhã", "Tarde", "Noite"]
  belongs_to :contractor
  belongs_to :user
  has_one_attached :photo
end
