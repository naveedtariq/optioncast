# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :option do
    stock_id 1
    price "9.99"
    volume 1
    expiry "2014-07-18"
    option_type "MyString"
    strike "9.99"
    last "9.99"
    bid "9.99"
    ask "9.99"
    open_interest 1
    delta "9.99"
    gamma "9.99"
    theta "9.99"
    vega "9.99"
    implied_volatility "9.99"
  end
end
