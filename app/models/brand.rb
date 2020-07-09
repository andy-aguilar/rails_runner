class Brand < ApplicationRecord
    has_many :shoes
    has_one :user, as: :profileable

    validates :name, presence: true, length: { minimum: 3 }

    #ANALYTICS
    def due_for_new_pair?
        runner_array = [] 
        self.shoes.each do |shoe|
            shoe.runner_shoes.each do |runner_shoe|
                if runner_shoe.get_miles.to_i > 250
                    runner_array << runner_shoe.runner 
                end 
            end
        end
        return runner_array.uniq
    end

end
