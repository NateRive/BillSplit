class RemoveColumn3FromCharges < ActiveRecord::Migration[5.1]

  def change
    remove_foreign_key :charges, :users
    remove_index :charges, :userid
    remove_reference :charges, :user
  end
end
