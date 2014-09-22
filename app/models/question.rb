class Question < ActiveRecord::Base
  self.inheritance_column = nil
  
  belongs_to :goal
  has_many :answers
  has_many :user_answers
  has_many :plan_criterias

  class Kind
    VALUE = "Value"
    DROPDOWN = "Dropdown"
    #NAME = {VALUE=>"Value", DROPDOWN=>"Dropdown"}
  end

end
