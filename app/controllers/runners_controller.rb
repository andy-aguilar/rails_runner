class RunnersController < ApplicationController
    before_action :set_runner, only: [:show]
    
    def index
        @runners = Runner.all
    end

    def show
    end

    private

    def set_runner
        @runner = Runner.find(params[:id])
    end
end
