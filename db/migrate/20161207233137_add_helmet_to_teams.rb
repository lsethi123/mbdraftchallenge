class AddHelmetToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :helmet, :string
  end
end
