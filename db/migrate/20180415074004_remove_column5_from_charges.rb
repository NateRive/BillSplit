class RemoveColumn5FromCharges < ActiveRecord::Migration[5.1]
    def change
      remove_column :charges, :amount, :integer
    end
end
