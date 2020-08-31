class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index; end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :content, :category_id, :status_id, :fee_id, :area_id, :day_id, :price, :user, ).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
