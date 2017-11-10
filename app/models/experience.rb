class Experience < ApplicationRecord
  has_and_belongs_to_many :users
  has_one :plan, dependent: :destroy
  has_many :selections, dependent: :destroy
  has_many :methoods, through: :selections
  validates :name, presence: true
  validates :description, presence: true
end
