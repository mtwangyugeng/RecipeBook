class ListItem < ApplicationRecord
  belongs_to :ingredient
  belongs_to :user
end
