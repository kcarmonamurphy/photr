FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'Password123$' }

    trait :full_permissions do
      before(:create) do |user|
        user.roles << Role.all
      end
    end
  end
end