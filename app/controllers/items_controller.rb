class ItemsController < ApplicationController
  before_action :move_to_index, except: %i[index show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show; end

  def edit; end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :content, :category_id, :status_id, :fee_id, :area_id, :day_id, :price, :user).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
