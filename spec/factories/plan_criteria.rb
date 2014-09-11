# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :plan_criterium, :class => 'PlanCriteria' do
    range "MyString"
    answer "MyString"
  end
end
