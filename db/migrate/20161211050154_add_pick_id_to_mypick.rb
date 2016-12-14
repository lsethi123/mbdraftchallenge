class AddPickIdToMypick < ActiveRecord::Migration
  def change
    add_column :mypicks, :pick_id, :integer
  end
end
