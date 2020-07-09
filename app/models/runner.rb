class Runner < ApplicationRecord
    has_many :runs
    has_many :runner_shoes
    has_many :shoes, through: :runner_shoes
    has_one :user, as: :profileable
    accepts_nested_attributes_for :user

    validates :name, presence: true
    validates :age, allow_nil: true, numericality: {only_integer: true, minimum: 1}
    validate :validates_shoe_size

    def get_miles
        total_distance = self.runs.map {|run| run.distance}
        total_distance_sum = total_distance.sum.round(2)
        return "#{total_distance_sum} #{'mile'.pluralize(total_distance_sum)}"
    end

    def total_runs
        self.runs.count
    end

    def sort_runs
       self.runs.sort_by{|run|run.date}.reverse!
    end


    private

    def validates_shoe_size
        shoe_size.nil? || (shoe_size - shoe_size.to_i == 0.5) || (shoe_size - shoe_size.to_i == 0)
    end


end
