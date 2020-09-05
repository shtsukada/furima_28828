class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy = BuyAddress.new
    redirect_to root_path unless user_signed_in?
    redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @item = Item.find(params[:item_id])
    @buy = BuyAddress.new(buy_params)
    # binding.pry
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_params
    params.permit(:item_id, :token, :postal_code, :area_id, :city, :address, :building, :tel, :buy_id).merge(user_id: current_user.id) # .merge(price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV['FURIMA_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
