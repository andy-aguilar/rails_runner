class RunnersController < ApplicationController
    before_action :set_runner, only: [:show, :edit, :update, :destroy, :my_runs, :my_shoes]
    
    def index
        @runners = Runner.all
    end

    def show
    end

    def my_runs
        
    end

    def my_shoes
    end

    def new
        @runner = Runner.new
    end
    
    def create
        @runner = Runner.new(runner_params)
        @user = User.new(user_params)
        if @user.valid? && @runner.valid?
            @user.save
            @user.profileable = @runner
            @user.save
            session[:user_id] = @user.id
            redirect_to runner_path(@runner)
        else
            @runner.valid?
            @errors = @runner.errors.full_messages.concat(@user.errors.full_messages)
            render :new
        end
    end

    def edit
        @user = @runner.user
    end

    def update
        @user = @runner.user
        @user.username = params[:user][:username]
        if @runner.update(runner_params) && @user.save
            redirect_to runner_path(@runner)
        else
            render 'edit'
        end
    end

    def destroy
        @runner.user.destroy
        @runner.destroy
        redirect_to root_path
    end

    private

    def set_runner
        @runner = Runner.find(params[:id])
    end

    def user_params
        params.require(:user_attributes).permit(:username, :password, :password_confirmation)
    end

    def runner_params
        params.require(:runner).permit(:name, :age, :shoe_size, :password, :password_confirmation)
    end
end
