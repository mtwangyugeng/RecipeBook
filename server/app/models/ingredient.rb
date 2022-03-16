class Ingredient < ApplicationRecord
    belongs_to :user
    has_many :amounts, dependent: :destroy
end
