class CampersController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found_thing

    def index
        camper = Camper.all
        render json: camper, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
            render json: camper, 
            serializer: CamperActivitySerializer, 
            status: :ok
    end

    def create
        camper = Camper.create(params_camper)
        if camper.valid?
            render json: camper, status: :created
        else
            render json: { errors: camper.errors.full_messages }, status: :unprocessable_entity
    end
end

    private

    def params_camper
        params.permit(:name, :age)
    end

    def not_found_thing
        render json: { "error": "Camper not found"}, status: :not_found
    end

end
