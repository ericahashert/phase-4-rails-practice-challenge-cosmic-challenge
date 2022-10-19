class ScientistsController < ApplicationController
    def index
        render json: Scientist.all
    end

    def show
        scientist = Scientist.find_by(id: params[:id])
        if scientist
            render json: scientist, serializer: ScientistPlanetSerializer
        else
            render json: { error: "Scientist not found" }, status: :not_found
        end
    end

    def create 
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update
        scientist = Scientist.find_by(id: params[:id])
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    def destroy 
        scientist = Scientist.find_by(id: params[:id])
        scientist.destroy
        render json: {}, status: :no_content
    end

    private

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end
end
