class CreateIncomeRankMetadata < ActiveRecord::Migration
  def change
    create_table :income_rank_metadata do |t|
      t.integer :lower_income
      t.integer :upper_income
      t.decimal :percentage
      t.decimal :percentage_below
    end
  end
end
