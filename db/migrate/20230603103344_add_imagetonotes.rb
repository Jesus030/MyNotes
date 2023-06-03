class AddImagetonotes < ActiveRecord::Migration[7.0]
  def down
    drop_table :notes
  end
end
