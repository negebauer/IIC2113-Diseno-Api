class User < ApplicationRecord
  rolify
  validates :name, presence: true
  validates :mail, presence: true
  has_and_belongs_to_many :experiences
  has_secure_password
  has_secure_token

  validates :name, :mail, presence: true
  validates :mail, uniqueness: true
  before_create :assign_default_role

  def assign_default_role
    add_role(:teacher) if roles.blank?
  end

  def invalidate_token
    update(token: nil)
  end

  def self.valid_login?(mail, password)
    user = find_by(mail: mail)
    user if user && user.authenticate(password)
  end
end
