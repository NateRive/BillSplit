class AddGroupidToCharge < ActiveRecord::Migration[5.1]
  def change
    add_reference :charges, :group, index: true, foreign_key: true
  end
end
