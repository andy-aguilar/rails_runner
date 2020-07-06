class Run < ApplicationRecord
    belongs_to :runner
    belongs_to :runner_shoe

    def run_location_and_date
        return "#{self.location} -- #{self.date.strftime('%m/%d/%Y')}"
    end
end
