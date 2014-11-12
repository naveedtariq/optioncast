class CreateRankingData < ActiveRecord::Migration
  def change
    create_table :ranking_data do |t|
      t.integer :lower_age
      t.integer :upper_age
      t.integer :median1
      t.integer :median10
      t.integer :median30
      t.integer :median50
      t.integer :median70
      t.integer :median90
      t.integer :median100
    end
  end
end
