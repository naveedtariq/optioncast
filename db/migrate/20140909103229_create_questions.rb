class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :type
      t.integer :order

      t.timestamps
    end
  end
end
