require "faker"

# default user
u = User.find_or_create_by!(email: "nisanur@example.com") do |user|
  user.name = "Nisanur"
  user.password = "123456"
  user.password_confirmation = "123456"
end

# sample posts
3.times do
  u.posts.find_or_create_by!(
    title:   Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraph(sentence_count: 2)
  )
end

puts "Seeded user: #{u.email} / 123456"
