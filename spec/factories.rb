FactoryGirl.define do
  factory :user do
    name     "Joshua Gudjohnsen"
    email    "joshua.gudjohnsen@gmail.com"
    password "mypass"
    password_confirmation "mypass"
  end
end