# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email                       "euser@example.com"
    password                    "foobar21"
    password_confirmation       "foobar21"  
  end
end
