class RunsController < ApplicationController
    before_action :set_run, only: [:show]
    
    def index
        @runs = Run.all
    end

    def show
    end

    private

    def set_run
        @run = Run.find(params[:id])
    end

end
