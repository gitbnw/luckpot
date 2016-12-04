class UsersController < ApplicationController
  def index
    @user = User.new
  end
  
  def create
      @user = User.new(user_params)
      @api_response = UL::PotluckAPI.new(user_params).add_user
      @user.attributes = @api_response.parsed_response
      @user.save


          respond_to do |format|
              format.js
          end 

      
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :id, :api_key)
  end  
  
end
