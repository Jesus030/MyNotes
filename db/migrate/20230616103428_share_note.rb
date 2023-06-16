class ShareNote < ActiveRecord::Migration[7.0]
  def change
    add_reference :Share_notes, :notes, null: false, foreign_key: true
    add_reference :Share_notes, :users, null: false, foreign_key: true

  end
end
