class Plan < ApplicationRecord
  belongs_to :experience

  has_many :selection_plans, dependent: :destroy
  has_many :selections, through: :selection_plans
  has_many :methoods, through: :selections

  has_many :goals, dependent: :destroy
  has_many :resources, dependent: :destroy
  has_one :diffusion, dependent: :destroy

  accepts_nested_attributes_for :selection_plans, allow_destroy: true
  accepts_nested_attributes_for :resources, allow_destroy: true
  accepts_nested_attributes_for :goals, allow_destroy: true
  accepts_nested_attributes_for :diffusion
end
