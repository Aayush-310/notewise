class AddUserIdToNotesTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes_tables, :user, null: false, foreign_key: true
  end
end
