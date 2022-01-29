# frozen_string_literal: true

FactoryBot.define do
  factory :curiosity_card do
    title { Faker::Book.title }
    content { Faker::Lorem.characters(number: 200) }
    user
    truthful { true }
    published { false }
    extra_comment { Faker::Lorem.characters }
    category { 'general' }

    after(:build) do |post|
      post.images.attach(io: File.open('test/fixtures/test_image.png'),
                         filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
