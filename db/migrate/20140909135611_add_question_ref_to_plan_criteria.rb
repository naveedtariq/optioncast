class AddQuestionRefToPlanCriteria < ActiveRecord::Migration
  def change
    add_reference :plan_criteria, :question, index: true
  end
end
