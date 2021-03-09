FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    profile               {'test'}
    password              {'000000q'}
    password_confirmation {password}
  end
end