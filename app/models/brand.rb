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

    def loyal_customers
        loyal_customers = []
        Runner.all.each do |runner|
            brand_array = runner.shoes.map {|shoe| shoe.brand}
            if brand_array.count(self) > 1
                loyal_customers << runner
            end
        end
        return loyal_customers
    end

end
