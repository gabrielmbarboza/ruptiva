module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!
      before_action :set_user, only: %i[show update destroy]
      before_action { authorize User }

      # GET /api/v1/users
      def index
        @users = User.all
        render json: @users
      end

      # GET /api/v1/users/1
      def show
        render json: @user
      end

      # PATCH/PUT /api/v1/users/1
      def update
        if @user.update(user_params)
          head :no_content
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/users/1
      def destroy
        @user.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = policy_scope(User).find(params[:id])
      end
        
      def user_params
        if params[:user][:password].blank?
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
        end
        params.permit(:email, :first_name, :last_name, :role)
      end
    end
  end
end
