class UsersController < ApplicationController
  def index
    @user = User.new
  end
  
  def create
      @user = User.new(user_params)
      @api_response = UL::PotluckAPI.new(user_params).response

      @user.attributes = @api_response.parsed_response

          respond_to do |format|
              format.html
              format.js
              format.json { render json: @user, status: :created, users: @user }
          end 

      
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :user_id, :api_key)
  end  
  
end
