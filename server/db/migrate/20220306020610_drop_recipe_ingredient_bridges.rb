class DropRecipeIngredientBridges < ActiveRecord::Migration[7.0]
  def change
    drop_table :recipe_ingredient_bridges
  end
end
