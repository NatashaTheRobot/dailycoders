# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :enrollment do
    user 1
    course 1
    admin false
  end

  factory :admin_enrollment do
    user 1
    course 1
    admin true
  end
end
