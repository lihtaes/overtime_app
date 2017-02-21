FactoryGirl.define do

  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name "Jon"
    last_name "Snow"
    email
    password "password"
    password_confirmation "password"
    phone "5551116666"
  end

  factory :admin_user, class: "AdminUser" do
    first_name "AdminJon"
    last_name "AdminSnow"
    email
    password "password"
    password_confirmation "password"
    phone "5551112222"
  end

  factory :non_authorized_user, class: "User" do
    first_name 'Non'
    last_name 'Authorized'
    email
    password "asdfasdf"
    password_confirmation "asdfasdf"
    phone "5552445444"
  end


end