class RemoveColumn2FromCharges < ActiveRecord::Migration[5.1]
  def change
    remove_column :charges, :amount, :integer
  end

  def change
    rename_column :charged_users, :amaount, :amount
  end
end
