class AddUserIdToNotes < ActiveRecord::Migration[7.0]
  def change
    add_column    :collection_notes, :topic, :string
    remove_column :collection_notes, :user_id
    add_reference :collection_notes, :user, null: false, foreign_key: true
    add_reference :collection_notes, :note, null: false, foreign_key: true
    add_reference :notes, :user, null: false, foreign_key: true
  end
end
