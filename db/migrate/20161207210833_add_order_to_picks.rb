class AddOrderToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :order, :integer
  end
end
