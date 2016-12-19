class AddDrafteeIdToActual < ActiveRecord::Migration
  def change
    add_column :actuals, :draftee_id, :integer
  end
end
