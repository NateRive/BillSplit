class AddChargeIdToChargeUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :charged_users, :charge, foreign_key: true
  end
end
