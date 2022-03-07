class CreateAmounts < ActiveRecord::Migration[7.0]
  def change
    create_table :amounts do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.float :amount
      
      t.timestamps
    end
  end
end
