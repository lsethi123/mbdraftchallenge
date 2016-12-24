class AddActualIdToPick < ActiveRecord::Migration
  def change
    add_column :picks, :actual_id, :integer
  end
end
