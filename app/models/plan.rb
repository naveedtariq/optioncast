class Plan < ActiveRecord::Base
  has_many :plan_criterias
  belongs_to :goal
end
