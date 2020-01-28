class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true #uniquneness is when no two users are same
  has_secure_password # ask to enter pswd twice and validates it #because we put password:digest when generated scaffold
end
