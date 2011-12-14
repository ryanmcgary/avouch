class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.integer :user_id
      t.string :name
      t.string :permalink

      t.timestamps
    end
    add_index :sites, :user_id
  end

  def self.down
    remove_index :sites, :user_id
    drop_table :sites
  end
end