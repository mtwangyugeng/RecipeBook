class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true

    has_many :recipes
    has_many :amounts
    has_many :ingredients
    has_many :procedures
    has_many :list_items

    def as_public_json
        self.as_json.except('password_digest')
    end
end
