class CreateShareNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :share_notes do |t|

      t.timestamps
    end
  end
end
