# frozen_string_literal: true

%w[New Progress Done].each { |status| Status.create(name: status) }

5.times do
  user = User.create(name: Faker::Name.name)
  Task.create(
    name: Faker::Name.name,
    description: Faker::Lorem.sentence(word_count: 3),
    user_id: user.id,
    status_id: Status.last.id
  )
end
