class User < ApplicationRecord
  has_secure_password
  has_secure_token

  def invalidate_token
    update(token: nil)
  end

  def self.valid_login?(mail, password)
    user = find_by(mail: mail)
    user if user && user.authenticate(password)
  end
end
