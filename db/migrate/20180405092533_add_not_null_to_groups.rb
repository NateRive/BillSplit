class AddNotNullToGroups < ActiveRecord::Migration[5.1]
  def change
    change_column :groups, :name, :string, null: false
  end
end
