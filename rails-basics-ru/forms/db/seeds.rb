# frozen_string_literal: true

10.times do
  Post.create(
    title: Faker::Lorem.sentence(word_count: 3),
    body: Faker::Lorem.sentence,
    summary: Faker::Lorem.sentence(word_count: 3),
    published: Faker::Boolean.boolean
  )
end
