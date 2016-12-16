class AddSecondIdToPick < ActiveRecord::Migration
  def change
    add_column :picks, :second_id, :integer
  end
end
