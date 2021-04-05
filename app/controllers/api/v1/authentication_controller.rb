module Api
  module V1
    class AuthenticationController < ApplicationController
      def login
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
          @token = JsonWebToken.encode(user_id: @user.id)
          @time = Time.now + 24.hours.to_i
          render :login, status: :ok

        else
          if @user.present?
            @user.errors.add(:password, "is not valid!")
            render json: { error: @user.errors.full_messages }, status: :unauthorized
          else
            render json: { error: {"Email": "Email does not exit!"} }, status: :unauthorized
          end
        end
      end

      # confirm email
      def confirm
        @user = User.find_by_confirmation_token(params[:id])

        if @user.present? && @user.confirmation_token_valid?
          @user.mark_as_confirmed!
          render json: { status: 'User confirmed successfully' }, status: :ok
        else
          render json: { status: 'Invalid token' }, status: :not_found
        end
      end

      private

      def login_params
        params.permit(:email, :password)
      end
    end
  end
end
