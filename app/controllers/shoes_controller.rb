class ShoesController < ApplicationController
    before_action :set_shoe, only: [:show]
    
    def index
        @shoes = Shoe.all
    end

    def show
    end

    def new
        @Shoe.new
    end

    def create
        @Shoe.new(shoe_params)
    end

    private

    def shoe_params
        params.require(:shoe).permit(:brand_id, :name, :price, :year)
    end

    def set_shoe
        @shoe = Shoe.find(params[:id])
    end
end
