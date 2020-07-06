class Shoe < ApplicationRecord
    belongs_to :brand
    has_many :runner_shoes
    has_many :runners, through: :runner_shoes

    def brand_with_name
        return "#{self.brand.name} #{self.name}"
    end
end
