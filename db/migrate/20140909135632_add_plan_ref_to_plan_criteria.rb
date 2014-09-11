class AddPlanRefToPlanCriteria < ActiveRecord::Migration
  def change
    add_reference :plan_criteria, :plan, index: true
  end
end
