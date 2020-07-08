class RunnerShoesController < ApplicationController

    before_action :set_runner_shoe, only: [:show, :destroy]

    def show
    end

    def new
        @runner_shoe = RunnerShoe.new
    end

    def create
        @runner_shoe = RunnerShoe.new(runner_shoe_params)
        if @runner_shoe.save
            redirect_to runner_path(@runner_shoe.runner)
        else
            render :new
        end
    end

    def destroy
        @runner = @runner_shoe.runner
        @runner_shoe.destroy
        redirect_to runner_path(@runner)
    end

    private

    def runner_shoe_params
        params.require(:runner_shoe).permit(:shoe_id, :runner_id)
    end

    def set_runner_shoe
        @runner_shoe = RunnerShoe.find(params[:id])
    end
end
