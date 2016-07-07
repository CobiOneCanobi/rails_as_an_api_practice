class CategoriesController < ApplicationController

  def show
    @status = Status.find_by(name: "Available")
    @items = Item.where(category_id: params[:id]).where(status_id: @status.id)
    render json: @items, no_status: true
  end

end
