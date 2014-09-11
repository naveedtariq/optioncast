class RemoveRangeFromPlanCriteria < ActiveRecord::Migration
  def change
    remove_column :plan_criteria, :range, :string
  end
end
