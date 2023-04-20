class ActivitiesController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found_thing


    def index
        activity = Activity.all
        render json: activity, status: :ok
    end

    def destroy
        activity = Activity.find(params[:id])
            activity.destroy
            head :no_content
    end        

    private

    def not_found_thing
        render json: { "error": "Activity not found"}, status: :not_found
    end

end
