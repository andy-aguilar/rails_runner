class RunsController < ApplicationController
    before_action :set_run, only: [:show, :edit, :update, :destroy]
    
    def index
        @runs = Run.order(date: :desc)
    end

    def show
    end

    def new
        @run = Run.new
    end

    def create
        @run = Run.new(run_params)
        @run.time = time_converter(params[:time_attributes])
        if @run.save
            redirect_to run_path(@run)
        else 
            render :new
        end
    end

    def edit
    end

    def update
        if @run.update(run_params)
            redirect_to run_path(@run)
        else
            render :edit
        end
    end

    def destroy
        @runner = @run.runner
        @run.destroy
        redirect_to runner_path(@runner)
    end

    private

    def run_params
        params.require(:run).permit(:runner_id, :runner_shoe_id, :location, :date, :distance, :time)
    end

    def set_run
        @run = Run.find(params[:id])
    end

end
