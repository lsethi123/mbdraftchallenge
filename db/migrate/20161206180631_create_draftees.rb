class CreateDraftees < ActiveRecord::Migration
  def change
    create_table :draftees do |t|
      t.string :info
      t.text :bio

      t.timestamps null: false
    end
  end
end
