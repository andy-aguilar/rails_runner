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
        @shoe.image_url = params[:shoe][:image].original_filename
        if @shoe.save
            byebug
            File.open(Rails.root.join('app', 'assets', 'images', @shoe.image_url), 'wb') do |file|
                file.write(@shoe.image_url.read)
            end
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
        params.require(:shoe).permit(:brand_id, :name, :price, :year, :image)
    end

    def set_shoe
        @shoe = Shoe.find(params[:id])
    end
end
