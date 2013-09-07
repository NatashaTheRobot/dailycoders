# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name "MyString"
    image_url "MyString"
    description "MyText"
    private false
  end
end
