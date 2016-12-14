class AddUserIdToMypicks < ActiveRecord::Migration
  def change
    add_column :mypicks, :user_id, :integer
  end
end
