class Runner < ApplicationRecord
    has_many :runs
    has_many :runner_shoes
    has_many :shoes, through: :runner_shoes
end
