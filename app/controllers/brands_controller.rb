class BrandsController < ApplicationController
    before_action :set_brand, only: [:show, :edit, :update, :destroy]
    
    def index
        @brands = Brand.all
    end

    def show
    end

    def new
        @brand = Brand.new
    end

    def create
        
    end

    def edit
    end

    def update
    end

    def destroy
    end
    

    private

    def brand_params
        params.require(:brand).permit(:name)
    end

    def set_brand
        @brand = Brand.find(params[:id])
    end
end
