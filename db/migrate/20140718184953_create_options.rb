class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :stock_id
      t.decimal :price, precision: 6, scale: 2
      t.integer :volume
      t.date :expiry
      t.string :option_type
      t.decimal :strike, precision: 7, scale: 2
      t.decimal :last, precision: 7, scale: 2
      t.decimal :bid, precision: 7, scale: 2
      t.decimal :ask, precision: 7, scale: 2
      t.integer :open_interest
      t.decimal :delta, precision: 7, scale: 4
      t.decimal :gamma, precision: 7, scale: 4
      t.decimal :theta, precision: 7, scale: 4
      t.decimal :vega, precision: 7, scale: 4
      t.decimal :implied_volatility, precision: 5, scale: 4

      t.timestamps
    end
  end
end
