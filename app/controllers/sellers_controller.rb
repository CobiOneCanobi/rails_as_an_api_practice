class SellersController < ApplicationController

  def show
    @items = Item.where(seller_id: params[:id])
    render json: @items, no_seller: true
  end

end
