class RunnerShoe < ApplicationRecord
    belongs_to :runner 
    belongs_to :shoe 
    has_many :runs
end
