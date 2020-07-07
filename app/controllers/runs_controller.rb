class RunsController < ApplicationController
    before_action :set_run, only: [:show]
    
    def index
        @runs = Run.all
    end

    def show
    end

    def new
        @runner = Runner.find(params[:id])
        @run = Run.new
    end

    def create
        @run = Run.new(run_params)
        if @run.save
            redirect_to run_path(@run)
        else 
            render :new
        end
    end

    private

    def run_params
        params.require(:run).permit(:runner_id, :runner_shoe_id, :location, :date, :distance, :time)
    end

    def set_run
        @run = Run.find(params[:id])
    end

end
