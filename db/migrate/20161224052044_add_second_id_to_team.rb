class AddSecondIdToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :second_id, :integer
  end
end
