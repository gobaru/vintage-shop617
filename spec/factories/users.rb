FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    profile               {'test'}
    password              {'000000q'}
    password_confirmation {password}
  end
end