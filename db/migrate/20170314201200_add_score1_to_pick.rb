class AddScore1ToPick < ActiveRecord::Migration
  def change
    add_column :picks, :score1, :integer
  end
end
