class RunnerShoe < ApplicationRecord
    belongs_to :runner 
    belongs_to :shoe 
    has_many :runs

    def brand_with_name
        return "#{self.shoe.brand.name} #{self.shoe.name}"
    end

    def get_miles
        total_distance = self.runs.map {|run| run.distance}
        total_distance_sum = total_distance.sum
        return "#{total_distance_sum} #{'mile'.pluralize(total_distance_sum)}"
    end
end
