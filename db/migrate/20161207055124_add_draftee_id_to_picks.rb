class AddDrafteeIdToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :draftee_id, :integer
  end
end
