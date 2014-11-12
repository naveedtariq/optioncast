class AddFieldsToPlan < ActiveRecord::Migration
  def change
    remove_column :plans, :details, :text
    add_column :plans, :about, :string
    add_column :plans, :discription, :text
    add_column :plans, :fine_print, :text
    add_column :plans, :pros, :text
    add_column :plans, :cons, :text
    add_column :plans, :recommendation, :text
    add_column :plans, :link, :string
  end
end
