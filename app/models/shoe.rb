class Shoe < ApplicationRecord
    belongs_to :brand
    has_many :runner_shoes
    has_many :runners, through: :runner_shoes
end
