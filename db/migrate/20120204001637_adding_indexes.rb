class AddingIndexes < ActiveRecord::Migration
  def self.up
  	add_index :sites, :permalink
	add_index :remoteurls, :permalink
  end

  def self.down
	remove_index :sites, :column => :permalink
	remove_index :remoteurls, :column => :permalink
  end
end



