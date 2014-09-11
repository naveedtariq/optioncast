class Goal < ActiveRecord::Base
  has_many :questions
  has_many :plans
  has_many :users
end
