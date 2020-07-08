class User < ApplicationRecord
    has_secure_password
    belongs_to :profileable, polymorphic: true, optional: true
    validates :username, presence: true, uniqueness: true
end
