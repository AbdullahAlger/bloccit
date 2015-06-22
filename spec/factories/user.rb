FactoryGirl.define do
  factory :user do
    name "Abdullah Alger"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end

  factory :user_with_post_and_comment, parent: :user do
    transient do
      comments_count 1
    end
    after(:build) do |user, evaluator|
      post = create(:post, user: user)
      create_list(:comment, evaluator.comments_count, user: user, post: post)
    end
  end
end

