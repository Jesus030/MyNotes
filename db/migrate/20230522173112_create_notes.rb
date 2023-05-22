class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :topic
      t.string :reference
      t.string :picture
      t.text :description

      t.timestamps
    end
  end
end
