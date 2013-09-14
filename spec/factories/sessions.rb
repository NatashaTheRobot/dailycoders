# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :session do
    course nil
    start_date Date.today.advance(weeks: 1)
    end_date Date.today.advance(weeks: 13)
  end
end
