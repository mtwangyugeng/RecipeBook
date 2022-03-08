class DropReferencesAmounts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :amounts, :ingredient
    remove_reference :amounts, :recipe
  end
end
