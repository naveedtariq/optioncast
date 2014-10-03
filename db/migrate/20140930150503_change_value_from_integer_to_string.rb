class ChangeValueFromIntegerToString < ActiveRecord::Migration
  def change
    change_column :user_answers, :value, :string
  end
end
