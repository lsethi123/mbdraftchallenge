class CreateMypicks < ActiveRecord::Migration
  def change
    create_table :mypicks do |t|

      t.timestamps null: false
    end
  end
end
