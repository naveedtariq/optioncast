# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_answer, :class => 'UserAnswers' do
    answer 1
  end
end
