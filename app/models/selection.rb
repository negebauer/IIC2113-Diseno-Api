class Selection < ApplicationRecord
  belongs_to :experience
  belongs_to :methood

  validates :methood_id, :experience_id, uniqueness: true, on: :create
  validates :methood_id, :experience_id, presence: true, on: :create
end
