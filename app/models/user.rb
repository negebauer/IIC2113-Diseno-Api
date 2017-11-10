class User < ApplicationRecord
  has_and_belongs_to_many :experiences
  has_secure_password
  has_secure_token

  validates :name, :mail, presence: true
  validates :mail, uniqueness: true

  def invalidate_token
    update(token: nil)
  end

  def self.valid_login?(mail, password)
    user = find_by(mail: mail)
    user if user && user.authenticate(password)
  end
end
