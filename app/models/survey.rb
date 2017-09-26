# Survey
class Survey < ApplicationRecord
  belongs_to :evaluate
  has_many :questions
end
