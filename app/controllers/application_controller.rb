class ApplicationController < ActionController::Base

    def time_converter(time_params)
        hr_secs = time_params["hours"].to_i * 3600
        min_secs = time_params["minutes"].to_i * 60
        secs = time_params["seconds"].to_i
        decimals = time_params["decimals"].to_f/100
        total_seconds = (hr_secs + min_secs + secs + decimals)
        return total_seconds 
    end
    private

    # def runner_params(*args)
    #     params.require(:user['runner']).permit(*args)
    # end
end
