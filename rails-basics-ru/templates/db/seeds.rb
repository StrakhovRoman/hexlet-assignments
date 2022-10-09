# frozen_string_literal: true

10.times do
  Task.create(
    name: Faker::Lorem.sentence(word_count: 3, supplemental: true),
    description: Faker::Lorem.sentence,
    status: Faker::Verb.past,
    creator: Faker::Name.name,
    performer: Faker::Name.name,
    completed: Faker::Boolean.boolean
  )
end
