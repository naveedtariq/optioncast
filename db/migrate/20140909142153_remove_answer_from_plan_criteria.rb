class RemoveAnswerFromPlanCriteria < ActiveRecord::Migration
  def change
    remove_column :plan_criteria, :answer, :string
  end
end
