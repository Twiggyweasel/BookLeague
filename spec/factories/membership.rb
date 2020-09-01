FactoryBot.define do
  factory :membership do
    role { 0 }
    user
    club 
  end
end