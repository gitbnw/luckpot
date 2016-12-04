class ItemsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @api_response = UL::PotluckAPI.new(@user).get_items
    @items = @api_response.parsed_response

    @items.map! {|item| Item.new(item) } 
    @item = Item.new

          respond_to do |format|
              format.html
              format.js 
          end     
  end

  def create
    @item = Item.new(item_params)
    @user = User.find(params[:user_id])
    @item.user_id = @user.id
    
    @api_response = UL::PotluckAPI.new(@user).add_item item_params
    
    if @api_response.code == 201 
      redirect_to action: "index", :user_id => @user.id
    else
      raise
    end

  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :id, :api_key)
  end  
  
  def item_params
    params.require(:item).permit(:name, :user_id, :created_at, :updated_at)
  end   
end
