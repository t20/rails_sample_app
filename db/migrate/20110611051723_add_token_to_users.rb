class AddTokenToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :token, :integer
  end

  def self.down
    remove_column :users, :token
  end
end
