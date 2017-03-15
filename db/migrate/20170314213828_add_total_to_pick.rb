class AddTotalToPick < ActiveRecord::Migration
  def change
    add_column :picks, :total, :float
  end
end
