class ItemsController < ApplicationController
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :status_id, :load_id, :prefecture_id, :shipping_days_id, :price)
  end
end
