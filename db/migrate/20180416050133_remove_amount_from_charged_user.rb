class RemoveAmountFromChargedUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :charged_users, :amount, :integer
  end

end
