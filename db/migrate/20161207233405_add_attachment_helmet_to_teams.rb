class AddAttachmentHelmetToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :helmet
    end
  end

  def self.down
    remove_attachment :teams, :helmet
  end
end
