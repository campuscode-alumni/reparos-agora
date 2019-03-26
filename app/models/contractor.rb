class Contractor < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :category, presence: true

  belongs_to :category
  has_many :estimates
  has_one :profile
  accepts_nested_attributes_for :profile

  before_create do
    build_profile
  end
end
