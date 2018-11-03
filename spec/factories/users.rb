FactoryBot.define do
  factory :user do
    email 'john.doe@example.com'
    password 123123
    password_confirmation 123123
  end
end
