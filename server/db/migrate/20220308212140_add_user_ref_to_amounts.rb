class AddUserRefToAmounts < ActiveRecord::Migration[7.0]
  def change
    add_reference :amounts, :user, null: false, foreign_key: true
  end
end
