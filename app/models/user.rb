class User < ApplicationRecord
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :name, presence: true, length: { maximum: 10}
  validates :email, presence: true, length: { maximum: 30},
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
