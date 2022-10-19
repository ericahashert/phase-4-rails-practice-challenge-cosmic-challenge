class MissionsController < ApplicationController
    def create
        mission = Mission.create!(mission_parameters)
        if mission.valid?
            render json: mission.planet
        end
    end

private

def mission_parameters
    params.permit(:name, :scientist_id, :planet_id)
end

end
