class Brand < ApplicationRecord
    has_many :shoes
    has_one :user, as: :profileable

    validates :name, presence: true, length: { minimum: 3 }

end
