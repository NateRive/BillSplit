class AddColumnToChargedUser < ActiveRecord::Migration[5.1]
  def change
    add_column :charged_users, :status, :integer , null: false
  end
end
