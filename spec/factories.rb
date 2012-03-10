FactoryGirl.define do
  factory :usuario do
    nome     "Elomar Souza"
    email    "elomar@exemplo.com"
    password "123456"
    password_confirmation "123456"
  end
end
