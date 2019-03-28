class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :estimates
  validates :name, presence: true
  has_many :user_reviews

  def update_average
    update(average_rating: calculate_average)
  end

  private

  def calculate_average
    return 0 if user_reviews.empty?

    reviews_sum = user_reviews.sum(:score)
    reviews_count = user_reviews.count
    reviews_sum.to_f/reviews_count
  end
end
