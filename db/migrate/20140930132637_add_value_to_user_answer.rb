class AddValueToUserAnswer < ActiveRecord::Migration
  def change
    add_column :user_answers, :value, :integer
  end
end
