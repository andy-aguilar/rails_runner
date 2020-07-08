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
        @brand = Brand.new(brand_params)
        @user = User.new(user_params)
        if @user.valid? && @brand.valid?
            @user.save
            @user.profileable = @brand
            @user.save
            redirect_to brand_path(@brand)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @brand.update(brand_params)
            redirect_to brand_path(@brand)
        else  
            render :edit
        end
    end

    def destroy
        @brand.destroy
        redirect_to root_path
    end
    

    private

    def user_params
        params.require(:user_attributes).permit(:username, :password, :password_confirmation)
    end

    def brand_params
        params.require(:brand).permit(:name)
    end

    def set_brand
        @brand = Brand.find(params[:id])
    end
end
