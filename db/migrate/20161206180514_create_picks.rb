class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.boolean :round
      t.integer :number

      t.timestamps null: false
    end
  end
end
