class User < ApplicationRecord

  # Validate block
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :password, presence: true, length: { minimum: 8, maximum: 16 }

  # Include block
  has_secure_password

  # Relationship block


end
