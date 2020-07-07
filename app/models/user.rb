class User < ApplicationRecord
    belongs_to :profileable, polymorphic: true, optional: true
    validates :username, presence: true, uniqueness: true
end
