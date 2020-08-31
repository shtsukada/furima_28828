class ItemsController < ApplicationController
  def index; end


def create
  Item.create(item_params)
end

  private

  def item_params
    params.require(:item).permit(:image, :name, :content, :category_id, :status_id, :fee_id, :area_id, :days_id, :price, :user, ).merge(user_id: current_user.id)
  end

end
