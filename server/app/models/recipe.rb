class Recipe < ApplicationRecord
    belongs_to :user
    
    has_many :amounts, dependent: :destroy
    has_many :procedures, dependent: :destroy

    validates :title, presence: true
end
