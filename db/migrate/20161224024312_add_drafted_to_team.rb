class AddDraftedToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :drafted, :string
  end
end
