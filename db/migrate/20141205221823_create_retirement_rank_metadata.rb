class CreateRetirementRankMetadata < ActiveRecord::Migration
  def change
    create_table :retirement_rank_metadata do |t|
      t.integer :lower_age
      t.integer :upper_age
      t.decimal :savings_multiplier
    end
  end
end
