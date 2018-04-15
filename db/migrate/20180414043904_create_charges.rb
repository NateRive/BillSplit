class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.string :title, null: false
      t.references :user, foreign_key: true
      t.references :chargeduser, foreign_key: { to_table: :users }
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
