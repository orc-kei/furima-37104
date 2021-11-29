class BuysController < ApplicationController
  before_action :set_prototype, only: [:index, :create]
  before_action :authenticate_user!, only: :index
  before_action :move_to_root_path, only: :index


  def index
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private

  def set_prototype
    @item = Item.find(params[:item_id])
  end

  def buy_params
    params.require(:buy_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id,token: params[:token])
  end

  def move_to_root_path
    if current_user == @item.user 
      redirect_to root_path
    else @item.buy.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price, 
        card: buy_params[:token],  
        currency: 'jpy'               
      )
  end
end
