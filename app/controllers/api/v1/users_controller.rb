module Api
    module V1
        class UsersController < ApplicationController
            before_action :authorize_request, except: :create
            before_action :find_user, except: %i[create index]
          
            # GET /users
            def index
              @users = User.all
            end
          
            # GET /users/{username}
            def show
            end
          
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
              unless @user.update(user_params)
                render json: { errors: @user.errors.full_messages },
                       status: :unprocessable_entity
              end
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
                :avatar, :name, :username, :email, :password, :password_confirmation
              )
            end
        end
    end
end
