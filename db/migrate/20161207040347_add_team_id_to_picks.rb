class AddTeamIdToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :team_id, :integer
  end
end
