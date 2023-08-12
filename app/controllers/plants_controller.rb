class PlantsController < ApplicationController
    def index
        plants = Plant.all
        render json: plants
      end
    
      def show
        plant = Plant.find(params[:id])
        render json: plant
      end
    
      def create
        plant = Plant.new(name: params[:name], image: params[:image], price: params[:price])
        if plant.save
          render json: plant, status: :created
        else
          render json: { error: "Failed to create plant" }, status: :unprocessable_entity
        end
      end
end
