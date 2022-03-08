class AddRecipeRefAmounts < ActiveRecord::Migration[7.0]
  def change
    add_reference :amounts, :recipe, null: false, foreign_key: true
  end
end
