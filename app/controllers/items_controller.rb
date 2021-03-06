class ItemsController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
      render :new
    end
  end

    def show
    end
 
    def edit
    end

    def update
      @item.update(item_params)

      if @item.update(item_params)
         redirect_to item_path
     else
       render :edit
     end
   end

   def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
   end
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_day_id,:price).merge(user_id: current_user.id)
  end

  def set_prototype
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user == @item.user && @item.buy.blank?
    redirect_to root_path
   end
 end
end

