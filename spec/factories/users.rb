FactoryGirl.define do
  factory :user do
    name "Jovan Jovanovic"
    email "jovan@gmail.com"
    password "123456"
    password_confirmation "123456"
    company
  end
end
