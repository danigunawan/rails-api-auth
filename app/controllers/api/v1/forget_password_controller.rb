class Api::V1::ForgetPasswordController < ApplicationController

    def forgot
        if params[:email].blank?
            return render json: {
                error: "email not present"
            }
        end

        @user = User.find_by(email: params[:email])

        if @user.present?
            #send email here
           
            if @user.generate_password_token!
                UserMailer.forget_password(@user).deliver_now
                render json: {
                    status:'OK', 
                    msg: "email has been send"
                }, status: :ok
            end
        else
            render json: {
                status: "email address not found"
            }, status: :not_found
        end
    end

    def password_reset
        token = params[:token].to_s
        if params[:email].blank?
            return render json: {
                error: "token not present"
            }
        end

        user = User.find_by(reset_password_token: token)

        if user.present? && user.password_token_valid?
            if user.reset_password!(params[:password])
                render json: {
                    status: 'OK'
                }, status: :ok
            else
                render json: {
                    status: user.errors.full_messages
                }
            end
        else
            render json: {
                error: ['link not valid or expired. try generating new link']
            }, status: :not_found
        end
    end
end
