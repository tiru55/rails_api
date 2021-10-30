module Api
    module V1
        class RegistrationsController < ApplicationController
            def create
                @user = User.new(user_params)
                if @user.save
                    session[:user_id] = @user.id
                    render json: {
                        status: :created,
                        message: 'Registration Success'
                    }
                else 
                    render json: {status: 500}
                end
                
            end

            private

            def user_params
                params.permit(:first_name,:last_name,:email, :password, :password_confirmation,:phone)
            end
        end
    end
end
