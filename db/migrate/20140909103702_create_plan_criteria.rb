class CreatePlanCriteria < ActiveRecord::Migration
  def change
    create_table :plan_criteria do |t|
      t.string :range
      t.string :answer

      t.timestamps
    end
  end
end
