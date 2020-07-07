class Brand < ApplicationRecord
    has_many :shoes

    validates :name, presence: true, length: { minimum: 3 }

end
