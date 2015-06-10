# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"

5.times do
  user = User.new(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

50.times do
  Post.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end

posts = Post.all

100.times do
  Comment.create!(
    #user: users.sample,
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

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
    email: 'a@youremail.com',
    password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"


