class ChangeKindToStringInQuestions < ActiveRecord::Migration
  def change
    change_column :questions, :kind, :string
  end
end
