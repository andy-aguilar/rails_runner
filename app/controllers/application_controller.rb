class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :authorized
    helper_method :logged_in_admin?
    helper_method :logged_in_brand?
    helper_method :logged_in_runner?

    def time_converter(time_params)
        hr_secs = time_params["hours"].to_i * 3600
        min_secs = time_params["minutes"].to_i * 60
        secs = time_params["seconds"].to_i
        decimals = time_params["decimals"].to_f/100
        total_seconds = (hr_secs + min_secs + secs + decimals)
        return total_seconds 
    end

    def current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def authorized
        redirect_to login_path unless logged_in?
    end

    def logged_in_runner?
        logged_in? && @current_user.is_runner?
    end

    def logged_in_brand?
        logged_in? && @current_user.is_brand?
    end

    def logged_in_admin?
        logged_in? && @current_user.is_admin?
    end
end
