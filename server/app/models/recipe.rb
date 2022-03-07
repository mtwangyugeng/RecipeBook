class Recipe < ApplicationRecord
    belongs_to :user
    
    has_many :amounts, dependent: :destroy

    validates :title, presence: true
end
