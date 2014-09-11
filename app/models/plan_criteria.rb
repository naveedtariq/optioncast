class PlanCriteria < ActiveRecord::Base
  belongs_to :plan
  belongs_to :question
  belongs_to :answer
end
