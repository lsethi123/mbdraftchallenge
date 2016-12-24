class AddDrafteeIdToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :draftee_id, :integer
  end
end
