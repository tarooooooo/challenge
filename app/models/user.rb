class User < ApplicationRecord
  before_save{self.email = self.email.downcase}
  has_secure_password validations: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  with_options presence: true do
    validates :email, uniqueness: true,
                      length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }
    validates :nickname, length: { maximum: 50 }
    validates :password, presence: true, length: { minimum: 6 }
    validates :introduction, length: { maximum: 300 }
  end
end