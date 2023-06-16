class AddIndexToFriendships < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :title, :string
    add_column :collections, :topic, :string
    add_reference :collections, :notes, null: :true
    add_reference :collections, :user, null: :false
  end
end
