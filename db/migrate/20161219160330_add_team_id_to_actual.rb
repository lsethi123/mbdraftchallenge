class AddTeamIdToActual < ActiveRecord::Migration
  def change
    add_column :actuals, :team_id, :integer
  end
end
