class AddNum2ToPick < ActiveRecord::Migration
  def change
    add_column :picks, :num2, :integer
  end
end
