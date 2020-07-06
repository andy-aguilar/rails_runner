class Runner < ApplicationRecord
    has_many :runs
    has_many :runner_shoes
    has_many :shoes, through: :runner_shoes

    validates :name, presence: true
    validates :age, allow_nil: true, numericality: {only_integer: true, minimum: 1}
    validates :height, allow_nil: true, numericality: {only_integer: true, minimum: 1}
    validates :weight, allow_nil: true, numericality: {only_integer: true, minimum: 1}
    validate :validates_shoe_size

    private

    def validates_shoe_size
        shoe_size.nil? || (shoe_size - shoe_size.to_i == 0.5) || (shoe_size - shoe_size.to_i == 0)
    end
end
