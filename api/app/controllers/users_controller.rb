class UsersController < ApplicationController    
    # Handle ActiveRecord Not Found exception
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

# before_action :authorize, only: [:index, :show, :update, :destroy]

# get all users /users
def index
    users = User.all
    render json: users
end

# GET /users/:id
def show
    user = User.find(params[:id])
    render json: user, status: :ok
  end

#POST /users
def create
    user = User.create(user_params)
    if user.valid?
        session[:user_id] = user.id
        render json: { userId: user.id }, status: :created
    else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
end

# PUT/ PATCH /users/:id
def update
    user = User.find(params[:id])
    if user
        User.update(user_params)
        render json: user, status: :ok
    else
        render json: { error: "User not found" }, status: :unprocessable_entity
    end
end

# DELETE /USERS/:id
def destroy
    user = User.find(params[:id])
    if user 
        user.destroy 
        head :no_content
    else
        render json: { error: "User not found" }, status: :not_found
    end
end

private

# errors
def render_not_found_response
    render json: {errors: "User not found"}, status: :not_found
end

def user_params
    params.permit(:username, :email, :password, :user_type)
end

end


