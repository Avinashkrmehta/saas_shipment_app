
FactoryBot.define do
  factory :user do
	email { Faker::Internet.email }
    password { 'password' }
    encrypted_password { 'encrypted_password' }
    reset_password_token { nil }
    reset_password_sent_at { nil }
    remember_created_at { nil }
    role { :customer }
    name { Faker::Name.name }
    phone_number { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }
    onboarded { true }
    
  end
end