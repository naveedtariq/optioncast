class RenameRankingDataToFinancialRankMetadata < ActiveRecord::Migration
  def change
    rename_table :ranking_data, :financial_rank_metadata
  end
end
