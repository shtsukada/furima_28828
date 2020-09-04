class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
#    @item = Item.find(item_params)
  end

  def create
#    @item = Item.find(item_params)
  end

  # private

  # def item_params
  #   params.require(:item).permit(:image, :name, :content, :category_id, :status_id, :fee_id, :area_id, :day_id, :price, :user).merge(user_id: current_user.id)
  # end


end
