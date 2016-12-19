class AddNumberToActual < ActiveRecord::Migration
  def change
    add_column :actuals, :number, :integer
  end
end
