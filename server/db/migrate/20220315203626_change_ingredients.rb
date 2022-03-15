class ChangeIngredients < ActiveRecord::Migration[7.0]
  def change
    remove_column :ingredients, :image_url
    add_column :ingredients, :best_market, :string
    add_column :ingredients, :common_quantity, :float
    add_column :ingredients, :common_price, :integer
  end
end
