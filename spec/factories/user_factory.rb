FactoryBot.define do

  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password "123456"
    first_name "Kasia"
    last_name "Example"
    admin false
  end

  factory :admin, class: User do
    email 
    password "123456"
    admin true
    first_name "Admin"
    last_name "User"
  end

end
