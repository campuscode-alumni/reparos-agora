class Contractor < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :category, presence: true

  belongs_to :category
  has_many :estimates
  has_one :profile
  has_many :review_contractors
  accepts_nested_attributes_for :profile

  before_create do
    build_profile
  end
  
  def self.update_average(contractor)
    grade_total = 0
    review_num = 0
    contractor.review_contractors.each do |review|
      grade_total += review.grade
      review_num +=1
    end
    return nil if (review_num == 0) 
    average = grade_total/review_num
  end

end
