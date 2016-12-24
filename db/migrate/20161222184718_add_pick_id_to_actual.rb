class AddPickIdToActual < ActiveRecord::Migration
  def change
    add_column :actuals, :pick_id, :integer
  end
end
