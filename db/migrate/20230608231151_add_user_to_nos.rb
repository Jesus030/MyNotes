class AddUserToNos < ActiveRecord::Migration[7.0]
  

  def change
    add_index :notes, :user, index: true
  end
end
