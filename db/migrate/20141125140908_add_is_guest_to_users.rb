class AddIsGuestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_guest, :boolean
    add_column :users, :guest_token, :string
  end
end
