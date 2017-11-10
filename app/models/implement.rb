class Implement < ApplicationRecord
  belongs_to :plan
  has_one :blog, dependent: :destroy

  accepts_nested_attributes_for :blog
end
