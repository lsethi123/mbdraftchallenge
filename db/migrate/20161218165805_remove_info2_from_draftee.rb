class RemoveInfo2FromDraftee < ActiveRecord::Migration
  def change
    remove_column :draftees, :info2, :string
  end
end
