class CreateRecordings < ActiveRecord::Migration
  def self.up
    create_table :recordings do |t|
      t.integer :remoteurl_id
      t.integer :user_id
      t.string :audio_file
      t.string :call_id
      t.text :synopsis
      t.text :transcription
      t.boolean :call_completed

      t.timestamps
    end
    add_index :recordings, :user_id
    add_index :recordings, :remoteurl_id
  end

  def self.down
    remove_index :recordings, :remoteurl_id
    remove_index :recordings, :user_id
    drop_table :recordings
  end
end