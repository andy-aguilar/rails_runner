class SessionsController < ApplicationController

    def login
    end

    def process_login
        username =  params[:username]
        user = User.find_by(username: username)
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            if user.profileable_type == "Runner"
                redirect_to runner_path(user.profileable)
            elsif user.profileable_type == "Brand"
                redirect_to brand_path(user.profileable)
            end
        else
            redirect_to login_path
        end    
    end
end
