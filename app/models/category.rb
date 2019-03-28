class Category < ApplicationRecord
  validates :name, presence: true
  has_many :sub_categories  
  has_many :contractors
end
