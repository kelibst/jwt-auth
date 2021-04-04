module Api
  module V1
    class PasswordsController < ApplicationController
      before_action :authorize_request, only: %i[update]
      def forgot
        return render json: { error: 'Email not present' } if params[:email].blank? # check if email is present

        user = User.find_by_email(params[:email]) # if present find user by email

        if user.present?
          user.generate_password_token! # generate pass token
          # SEND EMAIL HERE

          PasswordResetMailer.send_password_reset_email(user).deliver
          render json: { status: 'ok' }, status: :ok
        else
          render json: { error: ['Email address not found. Please check and try again.'] }, status: :not_found
        end
      end

      def update
        byebug
      end

      def reset
        token = params[:token].to_s

        return render json: { error: 'Token not present' } if params[:email].blank?

        user = User.find_by(reset_password_token: token)

        if user.present? && user.password_token_valid?
          if user.reset_password!(params[:password])
            render json: { status: 'ok' }, status: :ok
          else
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: ['Link not valid or expired. Try generating a new link.'] }, status: :not_found
        end
      end

      def password_update_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
