class CreateToolTips < ActiveRecord::Migration
  def change
    create_table :tool_tips do |t|
      t.string :rank
      t.text :description
    end
  end
end
