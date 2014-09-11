class Answer < ActiveRecord::Base
  has_many :user_answers
  has_many :plan_criterias
  belongs_to :question 
end
