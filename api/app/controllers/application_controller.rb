class ApplicationController < ActionController::API
    include ActionController::Cookies
  
    def authorize
      if session[:user_id].present?
        @current_user = User.find_by(id: session[:user_id])
      else
        render json: { errors: ["Not authorized"] }, status: :unauthorized
      end
    end
    
    

    private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorize
      unless current_user
        render json: { error: "You are not logged in" }, status: :unauthorized
    end
  end

  end
  