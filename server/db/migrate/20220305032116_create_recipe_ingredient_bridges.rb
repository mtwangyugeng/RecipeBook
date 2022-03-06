class CreateRecipeIngredientBridges < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_ingredient_bridges do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.float :amount

      t.timestamps
    end
  end
end
