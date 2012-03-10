class Usuario < ActiveRecord::Base
  attr_accessible :nome, :email

  validates :nome, presence: true
end
