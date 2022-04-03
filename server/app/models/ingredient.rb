class Ingredient < ApplicationRecord
    belongs_to :user
    has_many :amounts, dependent: :destroy
    has_many :list_items, dependent: :destroy
end
