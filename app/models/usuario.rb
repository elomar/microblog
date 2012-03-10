class Usuario < ActiveRecord::Base
  attr_accessible :nome, :email

  validates :nome, presence: true, length: { maximum: 50 }
  validates :email, presence: true
end
