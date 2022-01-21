FactoryBot.define do
  factory :curiosity_card do
    title { Faker::Book.title }
    content { Faker::Lorem.characters(number: 200) }
    user

    after(:build) do |post|
      post.images.attach(io: File.open('test/fixtures/test_image.png'),
                         filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
