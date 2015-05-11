# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tour_category do
    sequence(:name) {|i| "Tour Category-#{i}" }
  end
end
