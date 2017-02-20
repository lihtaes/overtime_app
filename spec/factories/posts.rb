FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Some Rationale"
    user
    overtime_request 2.5
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Some more content"
    user
    overtime_request 1.5
  end

  factory :third_post, class: "Post" do
    date Date.today
    rationale "You can't see me if you didn't post me"
    admin_user
    overtime_request 0.5
  end

end