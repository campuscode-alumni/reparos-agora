class Profile < ApplicationRecord
  belongs_to :contractor
  has_many :profile_sub_categories
  has_many :sub_categories, through: :profile_sub_categories
end
