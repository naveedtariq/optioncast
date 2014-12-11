class CreateHelpTips < ActiveRecord::Migration
  def change
    create_table :help_tips do |t|
      t.string :title
      t.text :description
    end
  end
end
