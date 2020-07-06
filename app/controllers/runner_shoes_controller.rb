class RunnerShoesController < ApplicationController

    before_action :set_runner_shoe, only: [:show]

    def show
    end

    private

    def set_runner_shoe
        @runner_shoe = RunnerShoe.find(params[:id])
    end
end
