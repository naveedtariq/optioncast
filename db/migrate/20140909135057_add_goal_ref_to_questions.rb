class AddGoalRefToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :goal, index: true
  end
end
