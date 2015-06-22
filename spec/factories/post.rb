FactoryGirl.define do
  factory :post do
    title "post title"
    body "posts must have a lot of text to be accepted"
    user
    topic { Topic.create(name: "Topic name") }
  end
end