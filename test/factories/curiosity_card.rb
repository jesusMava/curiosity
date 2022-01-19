FactoryBot.define do
  factory :curiosity_card do
    title { Faker::Book.title }
    content { Faker::Lorem.characters(number: 200) }
    user
  end
end
