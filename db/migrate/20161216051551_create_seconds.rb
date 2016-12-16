class CreateSeconds < ActiveRecord::Migration
  def change
    create_table :seconds do |t|
      t.string :info
      t.text :bio

      t.timestamps null: false
    end
  end
end
