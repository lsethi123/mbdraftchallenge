class AddScore2ToPick < ActiveRecord::Migration
  def change
    add_column :picks, :score2, :integer
  end
end
