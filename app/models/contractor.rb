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
  
  def update_average
    grade_total = self.review_contractors.all.sum('grade').to_f
    review_num = self.review_contractors.all.count
    return nil if (review_num == 0) 
    self.average = grade_total/review_num
    self.save!
  end

end
