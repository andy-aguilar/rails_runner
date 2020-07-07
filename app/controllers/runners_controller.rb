class RunnersController < ApplicationController
    before_action :set_runner, only: [:show, :edit, :update, :destroy]
    
    def index
        @runners = Runner.all
    end

    def show
    end

    def new
        @runner = Runner.new
    end

    def create
        @runner = Runner.new(runner_params)
        if @runner.save
            redirect_to runner_path(@runner)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @runner.update(runner_params)
            redirect_to runner_path(@runner)
        else
            render 'edit'
        end
    end

    def destroy
        @runner.destroy
        redirect_to root_path
    end

    private

    def set_runner
        @runner = Runner.find(params[:id])
    end

    def runner_params
        params.require(:runner).permit(:name, :age, :height, :weight, :shoe_size)
    end
end
