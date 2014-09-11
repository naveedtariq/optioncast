class AddGoalRefToPlans < ActiveRecord::Migration
  def change
    add_reference :plans, :goal, index: true
  end
end
