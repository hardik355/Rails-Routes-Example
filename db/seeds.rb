require 'faker'

# User.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }, { name: "Same" }])


# User Created
10.times do
  User.create(
    name: Faker::Name.name
  )
end


# Blog Created
20.times do
  Post.create(
    title: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 2),
    user_id: User.pluck(:id).sample
  )
end
