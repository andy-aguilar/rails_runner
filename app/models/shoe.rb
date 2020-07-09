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

    def self.get_all_runs(shoe_id)
        self.select(:'shoes.id', :'runs.runner_id', :'runs.distance').joins(runner_shoes: :runs).where(id: shoe_id)
    end

    def total_runs
        x = Shoe.get_all_runs(self.id).map do |run| 
            run.runner_id
        end.count
    end

    def total_miles
        Shoe.get_all_runs(self.id).map do |run| 
            run.distance
        end.sum
    end

    def average_miles_ran_per_run
        if self.total_runs > 0
            (self.total_miles / self.total_runs).round(2)
        else
            return 0
        end
    end

    def average_miles_ran_per_runner
        if self.total_runs > 0
            return (self.total_miles / self.runners.count).round(2)
        else 
            return 0
        end
    end

end
