class PlacesController < ApplicationController
    
    def index
        @places=Place.all
    end
    
    def new
        @places=Place.new
    end
    
    def create
        current_user.places.create(place_params)
        redirect_to root_path
    end
    
    before_action :authenticate_user!, only: [:new, :create]   
    
    private
    def place_params
        params.require(:place).permit(:name, :description, :address)
    end
end

