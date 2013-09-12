# Read about factories at https://github.com/thoughtbot/factory_girl

#  id          :integer          not null, primary key
#  provider    :string(255)
#  uid         :string(255)
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  gravatar_id :string(255)
#  location    :string(255)
#  nickname    :string(255)
#  email       :string(255)
#  slug        :string(255)
#  admin       :boolean

FactoryGirl.define do
  factory :user do
    provider "Github"
    uid "12345"
    name "NatashaTheRobot"
    gravatar_id "123455843908543905348"
    location "San Francisco"
    nickname "NatashaTheRobot"
    email "hi@natashatherobot.com"
  end

  factory :admin_user do
    provider "Github"
    uid "1233498545"
    name "NatashaTheRobot"
    gravatar_id "1234558439ajkdsf08905348"
    location "San Francisco"
    nickname "NatashaTheRobot"
    email "hi@natashatherobot.com"
    admin true
  end
end
