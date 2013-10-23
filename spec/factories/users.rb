# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "Github"
    uid "12345"
    name "NatashaTheRobot"
    gravatar_id "123455843908543905348"
    location "San Francisco"
    nickname "NatashaTheRobot"
    email "hi@natashatherobot.com"
    mentor false
  end

  factory :mentor do
    provider "Github"
    uid "12345"
    name "NatashaTheRobot"
    gravatar_id "123455843908543905348"
    location "San Francisco"
    nickname "NatashaTheRobot"
    email "hi@natashatherobot.com"
    mentor true
  end
end
