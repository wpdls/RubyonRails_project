class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true #uniquneness is when no two users are same
  has_secure_password # ask to enter pswd twice and validates it #because we put password:digest when generated scaffold
  after_destroy :ensure_an_admin_remains
  class Error < StandardError
  end
  private
    def ensure_an_admin_remains
    if User.count.zero?
    raise Error.new "Can't delete last user"
    end
  end
end
