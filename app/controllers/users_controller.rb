class UsersController < ApplicationController
  def index
    @user = User.new
  end
  
  def create
      @user = User.new(user_params)
      @api_response = UL::PotluckAPI.new(user_params).add_user
      @user.attributes = @api_response.parsed_response
      # puts @user

      # @user.attributes = {"api_key":"9f63e04facc4ec96e657279d34d9637a","id":"52"}
      @user.save


          respond_to do |format|
              format.html
              format.js
              format.json { render json: @user, status: :created, users: @user }
          end 

      
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :id, :api_key)
  end  
  
end
