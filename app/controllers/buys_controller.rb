class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy = Buy.new
  end

  def create
    @buy = Buy.new(buy_params)
    if @buy.valid?
      pay_item
      @buy.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

   private

  def buy_params
    params.require.(:buy).permit(:token).merge(item_id: price)
  end

  def pay_item
    Payjp.api_key = ENV["FURIMA_SECRET_KEY"]
    Payjp::Charge.create(
      amount: buy_params[:price],  # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
