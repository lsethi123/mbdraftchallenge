class RemoveDrafteeIdFromPicks < ActiveRecord::Migration
  def change
    remove_column :picks, :draftee_id, :integer
  end
end
