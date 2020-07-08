class AdminsController < ApplicationController
    before_action :set_admin, only: [:show, :destroy]
    def show
    end

    def new
        @admin = Admin.new
    end
    
    def create
        @admin = Admin.new(admin_params)
        @user = User.new(user_params)
        if @user.valid? && @admin.valid?
            @user.save
            @user.profileable = @admin
            @user.save
            session[:user_id] = @user.id
            redirect_to admin_path(@admin)
        else
            render :new
        end
    end

    def destroy
        @admin.user.destroy
        @admin.destroy
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user_attributes).permit(:username, :password, :password_confirmation)
    end

    def admin_params
        params.require(:admin).permit(:name)
    end

    def set_admin
        @admin = Admin.find(params[:id])
    end
end
