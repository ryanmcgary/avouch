class AddingIndexes < ActiveRecord::Migration
  def self.up
  	add_index :sites, :permalink
	add_index :sites, :user_id
	add_index :remoteurls, :site_id
	add_index :remoteurls, :permalink
  end

  def self.down
	remove_index :sites, :column => :permalink
	remove_index :sites, :column => :user_id
	remove_index :remoteurls, :column => :site_id
	remove_index :remoteurls, :column => :permalink
  end
end



