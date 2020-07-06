class ShoesController < ApplicationController
    before_action :set_shoe, only: [:show]
    
    def index
        @shoes = Shoe.all
    end

    def show
    end

    private

    def set_shoe
        @shoe = Shoe.find(params[:id])
    end
end
