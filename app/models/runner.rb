class Runner < ApplicationRecord
    has_many :runs
    has_many :runner_shoes
    has_many :shoes, through: :runner_shoes

    validates :name, presence: true
    validates :age, allow_nil: true, numericality: {only_integer: true, minimum: 1}
    validates :height, allow_nil: true, numericality: {only_integer: true, minimum: 1}
    validates :weight, allow_nil: true, numericality: {only_integer: true, minimum: 1}
    validate :validates_shoe_size

    def get_miles
        total_distance = self.runs.map {|run| run.distance}
        total_distance_sum = total_distance.sum
        return "#{total_distance_sum} #{'mile'.pluralize(total_distance_sum)}"
    end

    def total_runs
        self.runs.count
    end


    private

    def validates_shoe_size
        shoe_size.nil? || (shoe_size - shoe_size.to_i == 0.5) || (shoe_size - shoe_size.to_i == 0)
    end


end
