class AddIsUnderstoodToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_understood, :boolean
  end
end
