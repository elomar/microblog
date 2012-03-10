class Usuario < ActiveRecord::Base
  attr_accessible :nome, :email

  validates :nome, presence: true
  validates :email, presence: true
end
