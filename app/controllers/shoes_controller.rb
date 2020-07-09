class ShoesController < ApplicationController
    before_action :set_shoe, only: [:show, :edit, :update, :destroy]
    
    def index
        @shoes = Shoe.all
    end

    def show
    end

    def new
        @shoe = Shoe.new
    end

    def create
        @shoe = Shoe.new(shoe_params)
        if @shoe.save
            redirect_to shoe_path(@shoe)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @shoe.update(shoe_params)
            redirect_to shoe_path(@shoe)
        else
            render :edit
        end
    end

    def destroy
        @brand = @shoe.brand
        @shoe.destroy
        redirect_to brand_path(@brand)
    end

    private

    def shoe_params
        params.require(:shoe).permit(:brand_id, :name, :price, :year, :avatar)
    end

    def set_shoe
        @shoe = Shoe.find(params[:id])
    end
end
