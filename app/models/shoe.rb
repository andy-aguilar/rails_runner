class Shoe < ApplicationRecord
    has_one_attached :avatar
    
    belongs_to :brand
    has_many :runner_shoes
    has_many :runners, through: :runner_shoes

    def brand_with_name
        return "#{self.brand.name} #{self.name}"
    end

    def self.sorted_by_brand
        self.joins(:brand).merge(Brand.order(:name))
    end
end
