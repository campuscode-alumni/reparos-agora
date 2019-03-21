class Estimate < ApplicationRecord
  SHIFTS = ["Manhã", "Tarde", "Noite"]
  belongs_to :contractor
  belongs_to :user
  has_one_attached :photo
  validates :title, :description, :location, :service_date, :day_shift, presence: true
  validates :total_hours, :material_list, :material_fee, :visit_fee, :service_fee, presence: true, on: :update
end