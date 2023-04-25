class SessionsController < ApplicationController

    # Authorization
    before_action :authorize_unauthenticated, only: :create

    #Login
    def create
        user = User.find_by(username: params[:username]) || User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          session[:user_id] = user.id
          render json: { userId: user.id }, status: :ok
        else
          render json: { errors: "Invalid username or password" }, status: :unauthorized
        end
    end
      

    #Logout
    def destroy
        session.delete :user_id
        render json: { message: "You have been logged out" }, status: :ok
    end

    private

    def authorize_unauthenticated
      render json: { errors: "You are already logged in" }, status: :unprocessable_entity if current_user
    end

    
end
