# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tour do
    sequence(:name) {|i| "Tour-#{i}" }
    sequence(:code) {|i| "Code-#{i}" }
    tour_category_id 1
  end
end
