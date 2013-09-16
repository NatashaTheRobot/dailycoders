# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lesson do
    session nil
    overview "MyText"
    date_available "2013-09-16 06:50:59"
  end
end
