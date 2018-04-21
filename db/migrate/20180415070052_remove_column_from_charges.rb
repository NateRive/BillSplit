class RemoveColumnFromCharges < ActiveRecord::Migration[5.1]
  def change
    remove_column :charges, :amount, :integer
    remove_column :charges, :chargeduser_id, :integer
  end
end
