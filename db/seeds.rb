# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"

150.times do
  Topic.create!(
      name: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph
  )
end
topics = Topic.all

3.times do
  user = User.new(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

300.times do
  post = Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
  post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
  post.create_vote
  post.update_rank
end

posts = Post.all

# 50.times do
#   Summary.create!(
#     description: Faker::Lorem.paragraph,
#     post: posts.sample
#   )
# end

100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

50.times do
  Advertisement.create!(
    title: Faker::Commerce.product_name,
    copy: Faker::Company.name,
    price: Faker::Commerce.price
  )
end

admin = User.new(
   name: 'Admin User',
   email: 'admin@example.com',
   password: 'helloworld',
   role: 'admin'
)
admin.skip_confirmation!
admin.save!

moderator = User.new(
   name: 'Moderator User',
   email: 'moderator@example.com',
   password: 'helloworld',
   role: 'moderator'
)
moderator.skip_confirmation!
moderator.save!

member = User.new(
   name: 'Member User',
   email: 'member@example.com',
   password: 'helloworld'
)
member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Summary.count} summaries created"


