FactoryBot.define do
  factory :user do
    username { "MyString" }
    password_digest { "MyString" }
    age { 1 }
    email { "MyString" }
  end
end
