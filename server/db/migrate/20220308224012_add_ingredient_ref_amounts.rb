class AddIngredientRefAmounts < ActiveRecord::Migration[7.0]
  def change
    add_reference :amounts, :ingredient, null: false, foreign_key: true
  end
end
