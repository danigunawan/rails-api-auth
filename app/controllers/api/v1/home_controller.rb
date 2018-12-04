class Api::V1::HomeController < ApplicationController
    before_action :authenticate_user, only: [:auth]
    before_action :authorize_as_admin, only: [:auth_admin]

    def index
        render json: {
            service: 'auth-api'
        }, status: :ok
    end

    def auth
        render json: {
            status: 200, msg: "You are currently logged-in as #{current_user.name}"
        }
    end

    def auth_admin
        render json: {
            status: 200, msg: "You are currently logged-in as Admin #{current_user.name}"
        }
    end
end
