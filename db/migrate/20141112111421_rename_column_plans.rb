class RenameColumnPlans < ActiveRecord::Migration
  def change
    rename_column :plans, :discription, :description
  end
end
