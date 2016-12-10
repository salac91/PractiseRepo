FactoryGirl.define do
  factory :user do
    name "Jovan Jovanovic"
    email "jovan@gmail.com"
    password "123456"
    password_confirmation "123456"
    company
  end

  factory :user2 do
    name "Pera Peric"
    email "pera@gmail.com"
    password "123456"
    password_confirmation "123456"
    company
  end

end
