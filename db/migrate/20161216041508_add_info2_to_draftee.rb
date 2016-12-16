class AddInfo2ToDraftee < ActiveRecord::Migration
  def change
    add_column :draftees, :info2, :string
  end
end
