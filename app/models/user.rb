class User < ApplicationRecord
validates :password, length: {minimum: 4, maximum: 10, allow_nill: true }
  def password
    @password
  end
  def password=(raw)
    @password=raw
    self.password_digest = BCrypt::Password.create(raw)
  end
  def is_password?(raw)
    BCrypt::Password.new(password_digest).is_password?(raw)
  end
end
