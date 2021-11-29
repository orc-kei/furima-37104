class BuysController < ApplicationController
  before_action :set_prototype, only: :create

  def index
    @item = Item.find(params[:item_id])
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

  def pay_item
    Payjp.api_key = "sk_test_58c2a350bf7c721837c43ee2"  
      Payjp::Charge.create(
        amount: @item.price, 
        card: buy_params[:token],  
        currency: 'jpy'               
      )
  end
  
end
