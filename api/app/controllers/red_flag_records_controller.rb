class RedFlagRecordsController < ApplicationController
    #Authorization
    # before_action :authorize, only: [:create, :update, :destroy]
    # before_action :authorize_unauthenticated, only: [:index, :show]

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    # GET/red_flag_records
    def index
        red_flag_records = RedFlagRecord.all 
        render json: red_flag_records, status: :ok
    end

    # SHOW /foods/:id
    def show
        red_flag_records = RedFlagRecord.find(params[:id])
        render json: red_flag_records, status: :ok
     end

    # POST /red_flag_records
  def create
    red_flag_record = RedFlagRecord.create(red_flag_record_params)
    if current_user
      red_flag_record.user = current_user
    end

    if red_flag_record.save
      render json: red_flag_record, status: :created
    else
      render json: { error: red_flag_record.errors.full_messages }, status: :unprocessable_entity
    end
  end


  # PATCH/ red_flag_records
# PATCH/ red_flag_records
def update
  red_flag_record = RedFlagRecord.find(params[:id])
  if current_user.admin? # check if current user is an admin
    if red_flag_record.update(red_flag_record_params)
      render json: red_flag_record
    else
      render json: { errors: red_flag_record.errors.full_messages }, status: :unprocessable_entity
    end
  else # if the user is not an admin, disallow update to the status attribute
    if red_flag_record_params.key?(:status)
      render json: { error: "Only admin users can update status" }, status: :unprocessable_entity
    else
      if red_flag_record.update(red_flag_record_params)
        render json: red_flag_record
      else
        render json: { errors: red_flag_record.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end




    # DELETE /red_flag_records/:id
    def destroy
        red_flag_record = RedFlagRecord.find(params[:id])
    
        if current_user.admin?
            red_flag_record.destroy 
            head :no_content
        else
            render json: { error: "Only admin users can delete red flag records" }, status: :unprocessable_entity
        end
    end
         
    private

    def  red_flag_record_params
        params.require(:red_flag_record).permit(:title, :description, :latitude, :longitude, :image_url, :user_id, :status)
    end
          
    
    def render_not_found_response
        render json: { error: "RedFlag Record not found" }, status: :not_found
    end
        
    def render_unprocessable_entity
        render json: { error: "Validity errors" }, status: :unprocessable_entity
    end
    
  #   def authorize_unauthenticated
  #     unless current_user
  #       render json: { error: "You are not logged in" }, status: :unauthorized
  #   end
  # end


end
