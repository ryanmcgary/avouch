class AddRecordingsCountToRemoteurls < ActiveRecord::Migration
  def self.up
    add_column :remoteurls, :recordings_count, :integer, :default => 0

	  Remoteurl.reset_column_information
	  Remoteurl.find(:all).each do |p|
	    Remoteurl.update_counters p.id, :recordings_count => p.recordings.call_completed.length
	  end

  end

  def self.down
    remove_column :remoteurls, :recordings_count
  end
end
