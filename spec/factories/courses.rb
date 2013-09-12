# Read about factories at https://github.com/thoughtbot/factory_girl

#  name       :string(255)
#  slug       :string(255)
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime

FactoryGirl.define do
  factory :course do
    name "iOS for Beginners"
    start_date "2013-01-15"
    end_date "2013-03-15"
  end
end
