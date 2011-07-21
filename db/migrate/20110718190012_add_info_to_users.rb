class AddInfoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :profile_pic, :string
    add_column :users, :company, :string
    add_column :users, :phone_number, :integer
    add_column :users, :title, :string
    add_column :users, :description, :text
    add_column :users, :location, :string
    add_column :users, :full_name, :string
  end

  def self.down
    remove_column :users, :full_name
    remove_column :users, :location
    remove_column :users, :description
    remove_column :users, :title
    remove_column :users, :phone_number
    remove_column :users, :company
    remove_column :users, :profile_pic
  end
end
