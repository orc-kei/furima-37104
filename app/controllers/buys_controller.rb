class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private

  def buy_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :build, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end