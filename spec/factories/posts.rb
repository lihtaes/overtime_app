FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Some Rationale"
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Some more content"
    user
  end

  factory :third_post, class: "Post" do
    date Date.today
    rationale "You can't see me if you didn't post me"
    admin_user
  end

end