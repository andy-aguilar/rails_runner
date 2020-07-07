class UsersController < ApplicationController

    # def new_user_runner
    #     @user = User.new
    #     @profileable = Runner.new
    # end

    # def create_user_runner
    #     @user = User.new(user_params)
    #     @profileable = Runner.create(runner_params(params[:user][:runner]))
    #     @user.profileable = @runner
    #     byebug
    #     if @user.save
    #         redirect_to runner_path(@runner) 
    #     else
    #         render 'new_user_runner'
    #     end
    # end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end
