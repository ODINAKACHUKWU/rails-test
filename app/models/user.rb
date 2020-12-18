class User < ApplicationRecord
  has_secure_password

  validates :username, :password, :password_confirmation, presence: true
  validates :username, uniqueness: true

  def admin?
    admin
  end
end
