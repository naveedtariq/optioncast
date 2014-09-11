class AddAnswerRefToPlanCriteria < ActiveRecord::Migration
  def change
    add_reference :plan_criteria, :answer, index: true
  end
end
