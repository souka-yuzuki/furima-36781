class ItemsController < ApplicationController
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if Item.create(item_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :status_id, :load_id, :prefecture_id, :shipping_days_id, :price, :image).maerge(user_id: current_user.id)
  end
end
