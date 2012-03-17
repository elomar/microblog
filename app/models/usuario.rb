class Usuario < ActiveRecord::Base
  attr_accessible :nome, :email, :password, :password_confirmation

  validates :nome, presence: true, length: { maximum: 50 }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: VALID_EMAIL_REGEX, uniqueness: { case_sensitive: false }

  has_secure_password

  before_save :create_remember_token

  private
  
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
