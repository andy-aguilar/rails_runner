class Run < ApplicationRecord
    belongs_to :runner
    belongs_to :runner_shoe

    validates :date, presence: true
    validates :distance, presence: true
    validates :time, presence: true

    def run_location_and_date
        return "#{self.location} -- #{self.date.strftime('%m/%d/%Y')}"
    end

    def location_date_distance
        return "#{self.location} -- #{self.distance} #{'mile'.pluralize(self.distance)} -- #{self.date.strftime('%m/%d')}"
    end

    def format_time
        seconds = self.time % 60
        minutes = (self.time / 60) % 60
        hours = self.time / (60 * 60)
        # return "#{hours}:#{minutes}:#{seconds}"
        format("%02d:%02d:%02d", hours, minutes, seconds)
    end
end
