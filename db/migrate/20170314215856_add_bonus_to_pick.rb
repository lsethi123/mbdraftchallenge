class AddBonusToPick < ActiveRecord::Migration
  def change
    add_column :picks, :bonus, :float
  end
end
