class CreateActuals < ActiveRecord::Migration
  def change
    create_table :actuals do |t|
      t.string :info

      t.timestamps null: false
    end
  end
end
