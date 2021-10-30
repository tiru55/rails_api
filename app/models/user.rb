class User < ApplicationRecord
    has_secure_password
    acts_as_token_authenticatable
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
end
