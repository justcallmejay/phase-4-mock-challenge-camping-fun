class SignupsController < ApplicationController

    def create
        signup = Signup.create(params_signup)
        if signup.valid?
            render json: signup.activity, status: :created
        else
            render json: { errors: signup.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def params_signup
        params.permit(:time, :camper_id, :activity_id)
    end

end
