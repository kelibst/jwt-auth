module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorize_request, except: %i[create confirm_email]
      before_action :find_user, except: %i[create index confirm_email]

      # GET /users
      def index
        @users = User.all
      end

      # GET /users/{username}
      def show; end

      # POST /users
      def create
        @user = User.new(user_params)
        if @user.save
          render :show, status: :created
        else
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      # PUT /users/{username}
      def update
        return if @user.update(user_update_params)

        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end

      # DELETE /users/{username}
      def destroy
        @user.destroy
      end

      private

      def find_user
        @user = User.find_by_id!(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
      end

      def user_params
        params.permit(
          :name, :username, :email, :password, :password_confirmation, :token, :age
        )
      end

      def user_update_params
        params.require(:user).permit(:email, :password, :password_confirmation, :age)
      end
    end
  end
end
